class ChangeAreaCodeFromUsers < ActiveRecord::Migration
  def up
    change_column:users,:area_code,:string
  end

  def down
    change_column:users,:area_code,:integer
  end
end
