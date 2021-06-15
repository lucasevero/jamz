class ChatMembershipsController < ApplicationController

  def index
    # achar os do usuario
    @chat_memberships = ChatMembership.includes(:user, :chatroom).where(user: current_user)

    authorize @chat_memberships
  end
end
