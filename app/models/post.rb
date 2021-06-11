class Post < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :user
  has_many :likes, dependent: :delete_all

  validates :content, presence: true
  validates :content, length: { minimum: 1, maximum: 140 }

  has_many_attached :photos

  def has_like?(user)
    likes.find_by(user: user).present?
  end
end
