class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = Like.new()
    @like.user = current_user
    @like.post = @post
    authorize @like
    if @like.save
      redirect_to feed_users_path( anchor: "post-#{@post.id}" )
    else
      render :feed_users
    end
  end

  private 

  def set_post
    @post = Post.find(params[:id])
  end
end
