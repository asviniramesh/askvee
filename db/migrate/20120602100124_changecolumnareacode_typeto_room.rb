class ChangecolumnareacodeTypetoRoom < ActiveRecord::Migration
  def up
     change_column:rooms,:area_code,:string
  end

  def down
    change_column:rooms,:area_code,:integer
  end
end
