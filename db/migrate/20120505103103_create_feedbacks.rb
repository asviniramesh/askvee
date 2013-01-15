class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.integer :room_booking_id
      t.integer :sender_id
      t.integer :receiver_id
      t.string :role_type
      t.integer :rating
      t.text :description

      t.timestamps
    end
  end
  def self.down
    drop_table :feedbacks
  end
  
end
