class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def create
    @friend = User.find(params[:user_id])
    @chatroom = Chatroom.new(name: "#{@friend.username} - #{current_user.username}")
    @friend_membership= ChatMembership.new(user: @friend, chatroom: @chatroom)
    @current_user_membership= ChatMembership.new(user: current_user, chatroom: @chatroom)
    authorize @chatroom
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render "users/:id", { id: @friend.id }
    end
  end

  private

  def check_chatroom
    @chatroom = Chatroom.find_by(name: "#{@friend.username} - #{current_user.username}").exist?
  end

end
