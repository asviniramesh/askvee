class AddLengthToRoom < ActiveRecord::Migration
  def self.up
    add_column:rooms,:length,:integer
  end
  def self.down
  remove_column:rooms,:length,:integer
  end
  
end
