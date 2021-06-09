class MessagesController < ApplicationController

  def create
    raise
    @message = Message.new(message_params)
    authorize @message
  end


end
