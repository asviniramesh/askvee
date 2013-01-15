class AddfieldsToRooms < ActiveRecord::Migration
  def up
    add_column:rooms,:category_id,:integer
    add_column:rooms,:visiting_location,:string
  end

  def down
     remove_column:rooms,:category_id
    remove_column:rooms,:visiting_location
  end
end
