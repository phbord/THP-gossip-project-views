class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    @comments = comments_all
  end

  def new
    @tags = tags_all
  end

  def create
    #Récupération des champs du formulaire
    @post = Gossip.new(
      'title' => params[:title],
      'content' => params[:content],
      'user_id' => User.find_by(first_name: "anonymous").id,
      #'tag_id' => Tag.all.sample.id
      'tag_id' => params[:tag]
    )

    #Sauvegarde en BDD
    if @post.save
      redirect_to gossips_path, alert: "Enregistrement réussi !"
    else
      flash.now[:alert] = "Echec à l'enregistrement !"
      render 'new'
    end
  end

  def show
    @gossip = gossip_find
    @id = params[:id]
  end

  def edit
    @gossip = gossip_find
  end

  def update
    #Récupération des champs du formulaire
    @model = Model.find(params[:id])
    update_params = [
      'title' => params[:title],
      'content' => params[:content],
      'user_id' => User.find_by(first_name: "anonymous").id,
      'tag_id' => Tag.all.sample.id
    ]

    #Sauvegarde en BDD
    if @model.update(update_params)
      redirect_to @model, alert: "Enregistrement réussi !"
    else
      flash.now[:alert] = "Echec à l'enregistrement !"
      render :edit
    end
  end

  def destroy
    @gossip = gossip_find

    #Sauvegarde en BDD
    if @gossip.destroy
      redirect_to gossips_path, alert: "Suppression réussie !"
    else
      flash.now[:alert] = "Echec à la suppression !"
      render :show
    end
  end

  private

  def gossip_find
    Gossip.find(params[:id])
  end

  def comments_all
    Comment.all
  end

  def tags_all
    Tag.all
    #Tag.all.map { |t| [ t.title, t.id ] }
  end
end
