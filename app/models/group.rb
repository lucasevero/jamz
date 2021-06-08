class Group < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :users, through: :subscriptions

  validates :name, presence: true, uniqueness: true
end
