class City < ActiveRecord::Base
	belongs_to :state
  has_many :users, :class_name => "User", :foreign_key=>'city_id'
	has_many :locations, :dependent => :destroy
 
  attr_accessor :country_id,:step
	#validation for City name
	validates :name, :presence => {:message => "Please enter City Name (2-20 characters)"}
	validates :name,:length=>{:minimum=>2,:message => "Please enter City Name (2-20 characters)"}
	validates :name,:length=>{:maximum=>20,:message => "Too long! Maximum 20 characters"}
	validates_uniqueness_of :name, :message => "City Name already exists"
	validates :name, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"City can be only alphabets"}
	
	#validation for State name
	validates :state_id, :presence => {:message => "Please select state"}
	validates :country_id, :presence => {:message =>"Please select country"} ,:if => Proc.new { |at| at.step!="1" }

	
end
