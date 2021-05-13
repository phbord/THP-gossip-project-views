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
    @comment = Comment.find(params[:id])
  end

  def update
    #Récupération des champs du formulaire
    @model = Model.find(params[:id])
    update_params = [
      'content' => params[:content],
      'user_id' => User.find_by(first_name: "anonymous").id,
      'comment_type_id' => params[:gossip_id],
      'comment_type_type' => Gossip
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
    @comment = Comment.find(params[:id])

    #Sauvegarde en BDD
    if @comment.destroy
      redirect_to gossips_path, alert: "Suppression réussie !"
    else
      flash.now[:alert] = "Echec à la suppression !"
      render :show
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Veuillez vous connecter !"
      redirect_to new_session_path
    end
  end
end
