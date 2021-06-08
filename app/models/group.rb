class Group < ApplicationRecord
  belongs_to :user
  has_many :posts

  validates :name, presence: true, uniqueness: true
end
