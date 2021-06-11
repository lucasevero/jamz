class Genre < ApplicationRecord
  belongs_to :user

  GENRES = ['Samba', 'Rock', 'Metal', 'Pop']

  validates :name, inclusion: { in: GENRES }
end
