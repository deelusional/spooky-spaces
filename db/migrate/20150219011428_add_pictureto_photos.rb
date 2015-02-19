class AddPicturetoPhotos < ActiveRecord::Migration
  def change
  	add_column :photos, :picture, :string
  	add_index :photos, :picture 
  end
end
