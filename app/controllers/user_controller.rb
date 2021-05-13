class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    #Récupération des champs du formulaire
    @post = User.new(
      'email' => params[:email],
      'password' => params[:password],
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'describtion' => params[:describtion],
      'age' => params[:age],
      'city' => params[:city]
    )

    #Sauvegarde en BDD
    if @post.save
      redirect_to gossips_path, alert: "Enregistrement réussi !"
    else
      flash.now[:alert] = "Echec à l'enregistrement !"
      render 'new'
    end
  end
end
