class Post < ApplicationRecord
  belongs_to :groups
  belongs_to :users

  validates :content, presence: true
  validates :content, length: { minimum: 1, maximum: 140 }
end
