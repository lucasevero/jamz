class Genre < ApplicationRecord
  has_many :listenings
  has_many :users, through: :listenings
end
