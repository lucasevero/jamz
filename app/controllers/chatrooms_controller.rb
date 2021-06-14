class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def create
    @friend = User.find(params[:user_id])
    @chatroom = Chatroom.new(name: "#{@friend.username} - #{current_user.username}")
    # use build because the chatroom is not persisted and we need the chatroom id to create chat_membership
    @chatroom.chat_memberships.build(user: @friend)
    @chatroom.chat_memberships.build(user: current_user)
    # create_membership(@friend)
    # create_membership(current_user)
    authorize @chatroom
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render user_path(@friend)
    end
  end

  private

  def create_membership(app_user)
    ChatMembership.create(user: app_user, chatroom: @chatroom)
  end

end
