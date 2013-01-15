 class AddColumnToRoom < ActiveRecord::Migration
  def self.up
   drop_table :calender_updates
   add_column :room_bookings, :is_unavailable, :boolean, :default => false
  end
  
  def self.down
   remove_column :room_bookings, :is_unavailable
  end
  
end
