class ChangeColumnToUser < ActiveRecord::Migration
  def up
    change_column :users, :uid, :text
  end

  def down
    remove_column :users, :uid
  end
end
