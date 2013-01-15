class CreateRoomGreenProfiles < ActiveRecord::Migration
  def self.up
    create_table :room_green_profiles do |t|
      t.integer :room_id
      t.integer :green_profile_id
      t.boolean :is_yes,  :default => false
      t.timestamps
    end
  end
  def self.down
    drop_table :room_green_profiles
  end
  
end
