class RemoveForeignKeyFromSkills < ActiveRecord::Migration[6.0]
  def change
    remove_reference :skills, :instrument, index: true, foreign_key: true
  end
end
