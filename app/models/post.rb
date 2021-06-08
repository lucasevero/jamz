class Post < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :user

  validates :content, presence: true
  validates :content, length: { minimum: 1, maximum: 140 }
end
