require 'open-uri'

class User < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_create :set_default_avatar

  has_many :messages, dependent: :destroy
  has_many :chat_memberships, dependent: :destroy
  has_many :chatrooms, through: :chat_memberships
  has_many :skills, dependent: :destroy
  has_many :instruments, through: :skills
  has_many :posts, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  has_one_attached :photo

  accepts_nested_attributes_for :skills
  accepts_nested_attributes_for :instruments

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:username, :first_name, :last_name, :address],
    associated_against: {
      skills: [:experience],
      instruments: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }

  validates :description, length: { maximum: 200 }
  validates :address, :username, :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_default_avatar
    default = URI.open("https://www.pphfoundation.ca/wp-content/uploads/2018/05/default-avatar.png")
    self.photo.attach(io: default, filename: 'default.png', content_type: "image/png") unless self.photo.attached?
  end
end
