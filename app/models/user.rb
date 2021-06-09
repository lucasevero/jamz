class User < ApplicationRecord
  has_many :messages
  has_many :chat_memberships
  has_many :chatrooms, through: :chat_memberships
  has_many :skills
  has_many :instruments, through: :skills
  has_many :posts
  has_many :groups
  has_many :subscriptions

  has_one_attached :photo

  validates :description, length: { maximum: 200 }
  validates :address, :username, :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
