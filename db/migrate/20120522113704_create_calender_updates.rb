class CreateCalenderUpdates < ActiveRecord::Migration
  def self.up
    create_table :calender_updates do |t|
      t.text :date
      t.integer :accomodation_id
      t.boolean :is_booked, :default => false
      t.boolean :is_available, :default => false
      t.boolean :is_unavailable, :default => false
      t.timestamps
    end
  end
  def self.down
    drop_table :calender_updates
  end
  
end
