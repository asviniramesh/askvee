class AddHostIdToRoomBooking < ActiveRecord::Migration
  def self.up
    add_column:room_bookings,:host_id,:integer
  end
  def self.down
    remove_column:room_bookings,:host_id
end
end