class Chatroom < ApplicationRecord
  has_many :messages
  has_many :chat_memberships
  has_many :users, through: :chat_memberships
end
