class CreateListenings < ActiveRecord::Migration[6.0]
  def change
    create_table :listenings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
