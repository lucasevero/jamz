class User < ApplicationRecord
  has_many :messages
  has_many :chat_memberships
  has_many :chatrooms, through: :chat_memberships

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :groups
  has_many :subscriptions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
