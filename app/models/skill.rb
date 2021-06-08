class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  EXPERIENCE = ['Beginner', 'Intermediate', 'Pro']

  validates :experience, inclusion: { in: EXPERIENCE }
end
