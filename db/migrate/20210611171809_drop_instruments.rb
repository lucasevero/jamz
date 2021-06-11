class DropInstruments < ActiveRecord::Migration[6.0]
  def change
    drop_table :instruments
  end
end
