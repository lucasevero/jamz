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
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    authorize @user
  end
end
