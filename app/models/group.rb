class Group < ApplicationRecord
  belongs_to :users

  validates :name, presence: true, uniqueness: true
end
