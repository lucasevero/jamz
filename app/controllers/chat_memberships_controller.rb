class ChatMembershipsController < ApplicationController

  def index
    @chat_memberships = ChatMembership.all
    authorize @chat_memberships
  end
end
