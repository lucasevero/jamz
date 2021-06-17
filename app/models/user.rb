class User < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :messages, dependent: :destroy
  has_many :chat_memberships, dependent: :destroy
  has_many :chatrooms, through: :chat_memberships
  has_many :skills, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :likes, dependent: :delete_all

  has_one_attached :photo

  accepts_nested_attributes_for :skills
  accepts_nested_attributes_for :genres

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:username, :first_name, :last_name, :address],
    associated_against: {
      skills: [:experience, :instrument],
      genres: [:name]
    },
    using: {
      tsearch: { prefix: true }
    },
    order_within_rank: "users.updated_at DESC"

  validates :description, length: { maximum: 200 }
  validates :address, :username, :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
