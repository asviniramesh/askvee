class AddColumnToTourGuides < ActiveRecord::Migration
  def self.up
    add_column :rooms,:is_specific_location, :boolean
  end
  
   def self.down
    remove_column :rooms, :is_specific_location
  end
  
end
