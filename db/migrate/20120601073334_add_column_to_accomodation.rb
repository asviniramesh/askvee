class AddColumnToAccomodation < ActiveRecord::Migration
  
  def self.up
   add_column :rooms, :accommodates, :integer
 end
 
 def self.down
  remove_column :rooms, :accommodates
 end

end
