class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      log_in(@user)
      redirect_to gossips_path, success: "Bon retour parmi nous"
    else
      flash.now[:danger] = "Email ou mot de passe invalide !"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    #Sauvegarde en BDD
    if session.delete(:user_id)
      redirect_to gossips_path, alert: "Déconnexion !"
    else
      flash.now[:alert] = "Echec à la déconnexion !"
      render gossips_path
    end
  end
end
