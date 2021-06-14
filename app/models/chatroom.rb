class Chatroom < ApplicationRecord
  has_many :messages
  has_many :chat_memberships
  has_many :users, through: :chat_memberships

  def self.chatroom_exist?(friend, user)
    find_by(name: "#{friend.username} - #{user.username}").present? || find_by(name: "#{user.username} - #{friend.username}").present?
  end

  def self.set_chatroom(friend, user)
    @chatroom = find_by(name: "#{friend.username} - #{user.username}") || find_by(name: "#{user.username} - #{friend.username}")
  end

end
