class MessagesController < ApplicationController

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.chatroom = @chatroom
    authorize @message
    if @message.save
      redirect_to chatroom_path(@chatroom, anchor: "message#{@message.id}")
    else
      render 'chatrooms/show'
    end
  end


  private
  
  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
