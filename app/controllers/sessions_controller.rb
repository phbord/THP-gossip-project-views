class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      #Système de SESSIONS => vérifie la connexion
      log_in(@user)
      #Système de COOKIES => stocke le digest en base et créé les cookies
      remember(@user) if is_cookie?(params[:remember_me])
      #Redirection
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
    #Suppression en BDD
    if session.delete(:user_id)
    #if log_out(User)
      log_out(User)
      redirect_to gossips_path, alert: "Déconnexion !"
    else
      flash.now[:alert] = "Echec à la déconnexion !"
      render gossips_path
    end
  end
end
