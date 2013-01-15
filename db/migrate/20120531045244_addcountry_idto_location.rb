class AddcountryIdtoLocation < ActiveRecord::Migration
  def up
    add_column :locations, :country_id, :integer
  end

  def down
    remove_column :locations, :country_id
  end
end
