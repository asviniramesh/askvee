class AddProviderToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :provider, :string
    add_column :users, :uid, :integer
    add_column :users, :is_accepted, :boolean, :default => false
    add_column :users, :is_rejected, :boolean, :default => false
  end
  def self.down
    remove_column :users, :provider
    remove_column :users, :uid
    remove_column :users, :is_accepted
    remove_column :users, :is_rejected
  end
  
end
