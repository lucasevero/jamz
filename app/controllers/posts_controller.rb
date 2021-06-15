require 'open-uri'

class PostsController < ApplicationController
  include ActionView::Helpers::DateHelper
  layout "gifs", only: :gif

  def index
    @posts = Post.includes(:user).order(updated_at: :desc)
    @like = Like.new
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
      if @post.temp_gif_url.present?
        file = URI.open(@post.temp_gif_url)
        @post.photos.attach(io: file, filename: 'some-image.gif', content_type: 'image/gif')
      end
      redirect_to feed_users_path
    else
      render :new
    end
  end

  def gif
    authorize Post
  end

  private

  def post_params
    params.require(:post).permit(:content, :user, :group, :temp_gif_url, photos: [])
  end
end
