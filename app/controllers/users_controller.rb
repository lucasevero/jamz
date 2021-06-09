class UsersController < ApplicationController

  def feed
    @user = current_user
    @post = Post.new
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
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    authorize @user
  end
end
