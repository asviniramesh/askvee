class AddColumnToAccomodationProperty < ActiveRecord::Migration
   def self.up
   add_column :rooms, :property_id, :integer
 end
 
 def self.down
  remove_column :rooms, :property_id
 end
end
