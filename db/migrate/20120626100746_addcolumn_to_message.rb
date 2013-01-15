class AddcolumnToMessage < ActiveRecord::Migration
  def up
                add_column:messages,:category,:string
  end

  def down
                    remove_column:messages,:category
  end
end
