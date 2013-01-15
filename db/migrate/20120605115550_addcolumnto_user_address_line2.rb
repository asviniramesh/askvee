class AddcolumntoUserAddressLine2 < ActiveRecord::Migration
  def up
  add_column :users, :addressline2, :string
  end

  def down
   remove_column :users, :addressline2
  end
end
