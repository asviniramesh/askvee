class AddReceiverIdAndRenameUserIdInUserMessages < ActiveRecord::Migration
  def self.up
    rename_column :user_messages, :user_id, :sender_id
    add_column :user_messages, :receiver_id, :integer
  end

  def self.down
    rename_column :user_messages, :sender_id, :user_id
    remove_column :user_messages, :receiver_id
  end
end
