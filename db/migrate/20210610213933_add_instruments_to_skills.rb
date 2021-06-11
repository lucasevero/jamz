class AddInstrumentsToSkills < ActiveRecord::Migration[6.0]
  def change
    add_column :skills, :instrument, :string
  end
end
