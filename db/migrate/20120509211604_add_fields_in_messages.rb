class AddFieldsInMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :sender_id, :integer
    add_column :messages, :receiver_id, :integer
    add_column :messages, :is_read, :boolean, :default=>false
    add_column :messages, :is_trash, :boolean, :default=>false
    add_column :messages, :status, :string
    drop_table :user_messages
  end

  def self.down
    remove_column :messages, :sender_id
    remove_column :messages, :receiver_id
    remove_column :messages, :is_read
    remove_column :messages, :is_trash
    remove_column :messages, :status
  end
end
