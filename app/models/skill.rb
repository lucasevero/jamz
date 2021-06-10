class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  EXPERIENCE = ['Beginner', 'Intermediate', 'Pro']
  INSTRUMENTS = ['Guitar', 'Electric Guitar', 'Bass', 'Drums']

  validates :experience, inclusion: { in: EXPERIENCE }
  validates :instrument, inclusion: { in: INSTRUMENTS }
end
