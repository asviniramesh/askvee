class CreateCommissionFixings < ActiveRecord::Migration
  def self.up
    create_table :commission_fixings do |t|
      t.integer :percentage
      t.boolean :host_from_franchisee

      t.timestamps
    end
  end
  def self.down
    drop_table :commission_fixings
  end
  
end
