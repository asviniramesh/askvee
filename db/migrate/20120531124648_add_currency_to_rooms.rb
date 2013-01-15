class AddCurrencyToRooms < ActiveRecord::Migration
def self.up
  add_column:rooms,:currency,:string
end
def self.down
  remove_column:rooms,:currency
end
end
