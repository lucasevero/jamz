class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :groups, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
