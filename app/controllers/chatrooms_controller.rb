class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def create
    raise
    @friend = User.find(params[:user_id])
    @chatroom = Chatroom.new(name: "#{@friend.username} - #{current_user.username}")
    authorize @chatroom
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render "users/:id", { id: @friend.id }
    end
  end

end
