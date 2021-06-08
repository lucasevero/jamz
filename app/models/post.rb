class Post < ApplicationRecord
  belongs_to :groups
  belongs_to :user

  validates :content, presence: true
  validates :content, length: { minimum: 1, maximum: 140 }
end
