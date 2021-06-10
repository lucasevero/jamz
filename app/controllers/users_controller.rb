class UsersController < ApplicationController

  def feed
    @user = current_user
    @post = Post.new
    @posts = @posts = Post.all.order(updated_at: :desc)
    authorize @user
    authorize @post
    authorize @posts
  end

  def index
    @user = current_user
    if params[:query].present?
      sql_query = "username ILIKE :query \
                  OR first_name ILIKE :query \
                  OR last_name ILIKE :query \
                  OR address ILIKE :query
                  "
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @users = User.all
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
    @posts = @user.posts
    authorize @user
  end
end
