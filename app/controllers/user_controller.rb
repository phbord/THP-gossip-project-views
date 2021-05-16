class UserController < ApplicationController
  def show
    #@user = User.find(params[:id])
    @user = current_user
  end

  def new
    @cities = City.all
  end

  def create
    #Récupération des champs du formulaire
    remember_me = params[:remember_me]
    @user = User.new(
      'email' => params[:email],
      'password' => params[:password],
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'describtion' => params[:describtion],
      'age' => params[:age],
      #'city' => city
      'city_id' => params[:city]
    )

    #Sauvegarde en BDD
    if @user.save
      #Système de SESSIONS => vérifie la connexion
      log_in(@user)
      #Système de COOKIES => stocke le digest en base et créé les cookies
      remember(@user) if is_cookie?(remember_me)
      redirect_to gossips_path, alert: "Votre compte a bien été enregistré !"
    else
      flash.now[:danger] = "Votre compte n'a pas pu être créé, vérifiez si les champs sont bien remplis !"
      render 'new'
    end
  end
end
