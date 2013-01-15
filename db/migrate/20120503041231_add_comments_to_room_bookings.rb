class AddCommentsToRoomBookings < ActiveRecord::Migration
  def self.up
    add_column :room_bookings, :comments, :text
  end
  def self.down
    remove_column :room_bookings, :comments
  end
  
end
