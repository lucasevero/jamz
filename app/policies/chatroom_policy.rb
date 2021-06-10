class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    # checar se o chat é com ele mesmo && se algum chatroom_id do user bate com chatroom_id do friend
    record.chat_memberships.first != user && user.chat_memberships.select { |chat_membership| record.chat_memberships.first.user.chat_memberships.find_by(chatroom_id: chat_membership.chatroom_id)}.empty?
  end
end
