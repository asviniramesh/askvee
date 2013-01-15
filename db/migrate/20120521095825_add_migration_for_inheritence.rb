class AddMigrationForInheritence < ActiveRecord::Migration
  def up
    add_column :rooms, :type, :string
  end

  def down
    remove_column :rooms, :type
  end
end
