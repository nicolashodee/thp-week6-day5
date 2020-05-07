class GossipsController < ApplicationController
 
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]
  before_action :only_signed_in, only: [:new, :create, :edit, :update, :destroy]

  def index
    @gossip = Gossip.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(user: current_user, title: params[:title], content: params[:content])

    if @gossip.save
      flash[:success] = "Ton Gossip a été créé avec succès !"
      redirect_to @gossip
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @gossip.update(gossip_params)
      redirect_to @gossip, flash: {success: "Ton Gossip a été modifié avec succès !"}
    else
      render :edit
    end
  end

  def destroy
    @gossip.destroy
    flash[:danger] = "Le gossip a été supprimé."
    redirect_to gossips_path
  end

  private

  def gossip_params
    params.require(:gossip).permit(:user, :title, :content)
  end

  def set_gossip
    @gossip = Gossip.find(params[:id])
  end
end
