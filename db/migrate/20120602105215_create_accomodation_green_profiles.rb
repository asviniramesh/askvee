class CreateAccomodationGreenProfiles < ActiveRecord::Migration
  def self.up
    create_table :accomodation_green_profiles do |t|
       t.integer :accomodation_id
       t.text :green_profile_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :accomodation_green_profiles
  end
end
