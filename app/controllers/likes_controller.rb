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
    @like = Like.create!(
      user_id: current_user.id,
      like_target_id: params[:id],
      like_target_type: params[:type]
    )
    redirect_back(fallback_location: gossips_path)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    #l = Like.find_by(id: params[:id])
    l = Like.find_by(like_target_id: params[:id])
    l.delete
    #l.destroy
  end
end

private

def authenticate_user
  unless current_user
    flash[:danger] = "Veuillez vous connecter !"
    redirect_to new_session_path
  end
end
