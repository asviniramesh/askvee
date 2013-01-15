class CreateRoomBookings < ActiveRecord::Migration
  def self.up
    create_table :room_bookings do |t|
      t.integer :room_id
      t.integer :guest_id
      t.date    :check_in
      t.date    :check_out
      t.integer :no_of_person
      t.integer :no_of_days
      t.boolean :is_amount_paid
      t.float :actual_rate
      t.boolean :is_accepted, :default => false
      t.timestamps
    end
  end
  def self.down
    drop_table :room_bookings
  end
end
