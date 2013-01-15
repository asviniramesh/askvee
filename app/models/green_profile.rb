class GreenProfile < ActiveRecord::Base
	
	#Associations
	has_many :room_green_profiles
	has_many :accommodations, :through => :room_green_profiles

	#validation for GreenProfile name


	#~ validates_associated :accomodation
 	validates :name, :presence => {:message => "Please enter Green Profile (2-50 characters)"}
  validates :name, :format=>{:with=>/^(?:[a-zA-Z0-9\-\s\,])*[a-zA-Z](?:[a-zA-Z0-9\-\s\,])*$/, :message=>"Green Profile can be alphanumeric"}
	validates :name,:length=>{:minimum=>2,:message => "Please enter Green Profile 2-50 characters)"}
	validates :name,:length=>{:maximum=>80,:message => "Too long! Maximum 50 characters"}
	validates_uniqueness_of :name, :message => "Green Profile name Already Exists"
end