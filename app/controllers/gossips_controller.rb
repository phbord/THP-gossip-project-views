class GossipsController < ApplicationController
  def index
  end

  def new
  end

  def create
    #Récupération des champs du formulaire
    @post = Gossip.new(
      'title' => params[:title],
      'content' => params[:content],
      'user_id' => User.find_by(first_name: "anonymous").id,
      'tag_id' => Tag.all.sample.id
    )
    #Sauvegarde en BDD
    if @post.save
      flash.alert = "Enregistrement réussi !"
      redirect_to gossips_path
    else
      flash.alert = "Echec à l'enregistrement !"
      render 'new'
    end
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
