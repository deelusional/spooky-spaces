class AlterCommentsAddSpaceId < ActiveRecord::Migration
  def change
  	rename_column :comments, :place_id, :space_id
  end
end
