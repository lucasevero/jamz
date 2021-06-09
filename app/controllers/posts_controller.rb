class PostsController < ApplicationController
  include ActionView::Helpers::DateHelper
  
  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.group = post_params[:group] if params[:group].present?
    authorize @post
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user, :group, photos: [])
  end
end
