class AddCategoryTypeToRoom < ActiveRecord::Migration
 def up
    add_column:rooms,:category_type,:string
  end

  def down
     remove_column:rooms,:category_type
  end
end
