class AlterPlacesAddUserIdColumn < ActiveRecord::Migration
  def change
  	add_column :spaces, :user_id, :integer
    add_index :spaces, :user_id
  end
end
