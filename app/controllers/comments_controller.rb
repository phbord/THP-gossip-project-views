class CommentsController < ApplicationController
  def index
	p 'nivhr'
	debugger
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
    puts "*"*30
    p @post.comment_type_id
    puts "*"*30
    if @post.save
      puts "OK !!!!!!!!!!"
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
end
