class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = Like.new(user: current_user, post: @post)
    authorize @like
    if @like.save
      redirect_to feed_users_path
    else
      render :feed_users
    end
  end

  private 

  def set_post
    @post = Post.find(params[:id])
  end
end
