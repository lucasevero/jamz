class UsersController < ApplicationController

  def feed
    @user = current_user
    @post = Post.new
    @posts = @posts = Post.all.order(updated_at: :desc)
    @chat_memberships = ChatMembership.where(user: current_user)
    authorize @user
    authorize @post
    authorize @posts
  end

  def index
    @user = current_user

    if params[:query].present?
      @users = User.global_search(params[:query])
    else
      @users = User.includes(:skills)
    end

    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user })
      }
    end
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts
    @chat_memberships = ChatMembership.where(user: current_user)
    authorize @user
  end
end
