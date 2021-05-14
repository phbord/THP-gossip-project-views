class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
    #Récupération des champs du formulaire
    @post = Comment.new(
      'content' => params[:content],
      'user_id' => User.find_by(first_name: "anonymous").id,
      'comment_type_id' => params[:gossip_id],
      'comment_type_type' => Gossip
    )
    #Sauvegarde en BDD
    if @post.save
      redirect_to gossips_path, alert: "Enregistrement réussi !"
    else
      flash.now[:alert] = "Echec à l'enregistrement !"
      render gossip_path
    end
  end

  def show
  end

  def edit
    @id = params[:id]
    @gossip_id = params[:gossip_id]
    @comment = comment_find
  end

  def update
    #Récupération des champs du formulaire
    @post = comment_find
    # update_params = [
    #   'content' => params[:content],
    #   'comment_type_id' => params[:gossip_id],
    #   'comment_type_type' => Gossip
    # ]

    #Sauvegarde en BDD
    if @post.update(content: params[:content])
      #redirect_to @post, alert: "Enregistrement réussi !"
      redirect_to gossip_path(params[:gossip_id]), alert: "Enregistrement réussi !"
      #redirect_back(fallback_location: gossips_path, alert: "Enregistrement réussi !")
    else
      flash.now[:alert] = "Echec à l'enregistrement !"
      render :edit
    end
  end

  def destroy
    @gossip_id = params[:gossip_id]
    @comment = Comment.find(params[:id])

    #Sauvegarde en BDD
    if @comment.destroy
      #redirect_to gossips_path, alert: "Suppression réussie !"
      redirect_to gossip_path(@gossip_id), alert: "Suppression réussie !"
    else
      flash.now[:alert] = "Echec à la suppression !"
      render :show
    end
  end

  private

  def comment_find
    Comment.find(params[:id])
  end

  def post_params
    post_params = params.require(:comment).permit(:content)
  end
end
