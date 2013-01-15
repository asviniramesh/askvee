class CreateBreakFasts < ActiveRecord::Migration
  def change
    create_table :break_fasts do |t|
      t.string :name
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
