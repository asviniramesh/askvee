class CreateRoomAmenities < ActiveRecord::Migration
  def self.up
    create_table :room_amenities do |t|
      t.integer :room_id
      t.integer :amenity_id

      t.timestamps
    end
  end
  def self.down
    drop_table :room_amenities
  end
  
end
