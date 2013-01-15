class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.integer :host_id
      t.string :name
      t.string :address
      t.string :room_type
      t.text :description
      t.integer :country_id
      t.integer :state_id
      t.integer :city_id
      t.integer :location_id
      t.integer :area_code
      t.float :price
      t.boolean :is_available, :default => true
      t.boolean :is_approved, :default => false
      t.integer :approver_id
      t.timestamps
    end
  end
  def self.down
    drop_table :rooms
  end
end
