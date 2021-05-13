class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    #Récupération des champs du formulaire
    city = City.find_by(name: params[:city])
    @post = User.new(
      'email' => params[:email],
      'password' => params[:password],
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'describtion' => params[:describtion],
      'age' => params[:age],
      'city' => city
    )

    #Sauvegarde en BDD
    if @post.save
      log_in(@post)
      redirect_to gossips_path, alert: "Votre compte a bien été enregistré !"
    else
      flash.now[:danger] = "Votre compte n'a pas pu être créé, vérifiez si les champs sont bien remplis !"
      render 'new'
    end
  end
end
