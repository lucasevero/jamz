class Post < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :user

  validates :content, presence: true
  validates :content, length: { minimum: 1, maximum: 140 }

  has_many_attached :photos
end
