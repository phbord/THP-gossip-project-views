class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:show, :new, :create, :edit, :update, :destroy]

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
    @id = params[:id]
  end

  def update
    #Récupération des champs du formulaire
    @gossip = gossip_find

    #Sauvegarde en BDD
    if @gossip.update(post_params)
      redirect_to gossip_path, alert: "Enregistrement réussi !"
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
  end

  def post_params
    post_params = params.require(:gossip).permit(:title, :content)
  end
end
