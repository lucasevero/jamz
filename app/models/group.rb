class Group < ApplicationRecord
  belongs_to :users
  has_many :posts

  validates :name, presence: true, uniqueness: true
end
