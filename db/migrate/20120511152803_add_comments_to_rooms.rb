class AddCommentsToRooms < ActiveRecord::Migration
  def self.up
    add_column :rooms, :comment, :text
  end
  def self.down
    remove_column :rooms, :comment, :text
  end
  
end
