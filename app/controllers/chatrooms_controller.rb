class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def create
    @friend = User.find(params[:user_id])
    @chatroom = Chatroom.new(name: "#{@friend.username} - #{current_user.username}")
    @chatroom.save
    create_membership(@friend)
    create_membership(current_user)
    authorize @chatroom
    if @chatroom
      redirect_to chatroom_path(@chatroom)
    else
      render user_path(@friend)
    end
  end

  private

  def create_membership(app_user)
    ChatMembership.create(user: app_user, chatroom: @chatroom)
  end

  def check_chatroom
    @chatroom = Chatroom.find_by(name: "#{@friend.username} - #{current_user.username}").exist?
  end

end
