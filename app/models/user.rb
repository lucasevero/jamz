class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :skills
  has_many :instruments, through: :skills

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
