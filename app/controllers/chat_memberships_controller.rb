class ChatMembershipsController < ApplicationController

  def index
    @chat_memberships = ChatMembership.where(user: current_user)

    # achar os do usuario
    authorize @chat_memberships
  end
end
