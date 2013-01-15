class AddcolumntoUser < ActiveRecord::Migration
  def up
    add_column :users,:state_name,:string
    add_column :users,:city_name,:string
  end

  def down
     remove_column :users,:state_name,:string
     remove_column :users,:city_name,:string
  end
end
