class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :only_signed_in, only: [:new, :create, :edit, :update, :destroy]

  def index
    @comment = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(gossip_id: params[:gossip_id], content: params[:content],  user: current_user)
  
    if @comment.save
      flash[:success] = "Ton commentaire a été ajouté avec succès !"
      redirect_to @gossip
    else
      flash[:danger] = "Ton commentaire ne respecte pas le format adapté."
      redirect_to "/"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(content: params[:content])
      flash[:success] = "Le gossip a été mis à jour avec succès !"
      redirect_to gossip_path(id: @comment.gossip.id)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:danger] = "Le commentaire a été supprimé."
    redirect_to gossip_path(id: @comment.gossip.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:user, :gossip, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end