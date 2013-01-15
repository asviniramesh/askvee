class AddTransactionIdToPayments < ActiveRecord::Migration
  def self.up
    add_column:payments,:is_refund,:boolean,:default=>false
    add_column:payments,:transaction_id,:string
    add_column:payments,:refund_transaction_id,:string
  end
  def self.down
    remove_column:payments,:is_refund
    remove_column:payments,:transaction_id
    remove_column:payments,:refund_transaction_id
    end
end
