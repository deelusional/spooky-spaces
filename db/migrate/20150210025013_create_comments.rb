class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.string :rating

      t.integer :user_id
      t.integer :space_id	
      t.timestamps
    end

    add_index :comments, [:user_id, :space_id]
    add_index :comments, :space_id
  end
end
