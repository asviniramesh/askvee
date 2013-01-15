class ChangeCvvFromPayments < ActiveRecord::Migration
  def self.up
    change_column:payments,:cvv_number,:string
  end

  def self.down
    change_column:payments,:cvv_number,:integer
  end
end
