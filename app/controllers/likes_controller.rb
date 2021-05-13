class LikesController < ApplicationController
  before_action :authenticate_user

  def index
  end

  def new
  end

  def create
    #Récupération des champs du formulaire
    puts "<"*30
    p current_user
    p params[:type]
    puts ">"*30
    @like = Like.new(
      user_id: current_user.id,
      like_target_id: params[:id],
      like_target_type: params[:type]
    )
    id = params[:id]
    puts "*"*30
    puts id
    p @like
    puts "*"*30
    unless Like.find_by(like_target_id: params[:id])
      puts "="*30
      puts "="*30
      puts "COUCOU if"
      puts "="*30
      puts "="*30
      flash.now[:alert] = "Ce like existe !"
      redirect_back(fallback_location: gossips_path)
    end

    #Sauvegarde en BDD
    # if @post.save
    #   redirect_to gossips_path, alert: "Like enregistré !"
    # else
    #   flash.now[:alert] = "Echec à l'enregistrement du like !"
    #   render gossips_path
    # end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

private

def authenticate_user
  unless current_user
    flash[:danger] = "Veuillez vous connecter !"
    redirect_to new_session_path
  end
end
