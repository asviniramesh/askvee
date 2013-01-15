class CreateGreenProfiles < ActiveRecord::Migration
  def self.up
    create_table :green_profiles do |t|
      t.string :name

      t.timestamps
    end
  end
  def self.down
    drop_table :green_profiles
  end
  
end
