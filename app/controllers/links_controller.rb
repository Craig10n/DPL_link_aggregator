class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def show
    @comment = @link.comments.build
  end

  def index
    @links = Link.order(votes: :desc)
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @link.update_attributes(link_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path
  end

  def upvote
    @link.votes += 1
    @link.save
    redirect_to root_path
  end

  def downvote
    @link.votes -= 1
    @link.save
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :votes)
  end

  def set_link
    @link = Link.find(params[:id])
  end
end
