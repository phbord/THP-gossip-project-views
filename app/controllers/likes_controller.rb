class LikesController < ApplicationController
  before_action :authenticate_user, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
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
