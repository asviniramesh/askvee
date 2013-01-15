class State < ActiveRecord::Base
	belongs_to :country
	has_many :cities, :dependent => :destroy
  has_many :users, :class_name => "User", :foreign_key=>'state_id'
	
	#validation for State name
	validates :name, :presence => {:message => "Please enter State Name (2-20 characters)"}

	validates :name, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"State can be only alphabets"}
	validates :name,:length=>{:minimum=>2,:message => "Please enter State Name (2-20 characters)"}
	validates :name,:length=>{:maximum=>20,:message => "Too long! Maximum 20 characters"}
	validates_uniqueness_of :name, :message => "State Name already exists"
	
	#validation for Country name
	validates :country_id, :presence => {:message => "Please select country"}
end
