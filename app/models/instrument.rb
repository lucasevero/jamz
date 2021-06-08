class Instrument < ApplicationRecord
  has_many :skills
  has_many :users, through: :skills

  INSTRUMENTS = ['Guitar', 'Electric Guitar', 'Bass', 'Drums']

  validates :name, inclusion: { in: INSTRUMENTS }
end
