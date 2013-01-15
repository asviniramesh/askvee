class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :room_booking_id
      t.string :type_of_card
      t.text :card_number
      t.date :expiry_date
      t.integer :cvv_number
      t.string :name_as_on_card

      t.timestamps
    end
  end
  def self.down
    drop_table :payments
  end
  
end
