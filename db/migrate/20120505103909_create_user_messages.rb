class CreateUserMessages < ActiveRecord::Migration
  def self.up
    create_table :user_messages do |t|
      t.integer :message_id
      t.integer :user_id
      t.boolean :is_read
      t.boolean :is_trash
      t.string :status

      t.timestamps
    end
  end
  def self.down
    drop_table :user_messages
  end
  
end
