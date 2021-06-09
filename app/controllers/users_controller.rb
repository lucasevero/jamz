class UsersController < ApplicationController
  def feed
    @user = current_user
    @post = Post.new
    authorize @user
  end
end
