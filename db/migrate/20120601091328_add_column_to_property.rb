class AddColumnToProperty < ActiveRecord::Migration

  def self.up
   add_column :properties, :accomodation_id, :integer
 end
 
 def self.down
  remove_column :properties, :accomodation_id
 end

end
