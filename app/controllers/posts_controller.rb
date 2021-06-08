class PostsController < ApplicationController

  def new
    @post = Post.new
    authorize @post
  end
end
