class LikesController < ApplicationController
  before_action :authenticate_user

  def index
  end

  def new
  end

  def create
    #Récupération des champs du formulaire
    @like = Like.create!(
      user_id: current_user.id,
      like_target_id: params[:id],
      like_target_type: params[:type]
    )

    #Sauvegarde en BDD
    redirect_back(fallback_location: gossips_path, alert: "Ajout du like, réussie !")
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    #Récupération des champs du formulaire
    l = Like.find_by(like_target_id: params[:id])

    #Sauvegarde en BDD
    if l.destroy
      redirect_back(fallback_location: gossips_path, alert: "Suppression du like, réussie !")
    else
      flash.now[:alert] = "Echec à la suppression du like !"
      render gossips_path
    end
  end
end

private

def authenticate_user
  unless current_user
    flash[:danger] = "Veuillez vous connecter !"
    redirect_to new_session_path
  end
end
