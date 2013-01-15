class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
       t.token_authenticatable
       t.string :role
       t.string :first_name
       t.string :last_name
       t.string :user_name
       t.string :address
       t.string :home_phone
       t.string :mobile_phone
       t.integer :location_id
       t.integer :city_id
       t.integer :state_id
       t.integer :country_id
       t.integer :area_code
       t.string :email


      t.timestamps
    end

    add_index :users, :email,  :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
     add_index :users, :authentication_token, :unique => true
  end

end
