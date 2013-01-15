class Amenity < ActiveRecord::Base
	has_many :accommodations, :through => :room_amenities
	has_many :room_amenities
	

	#validation for Amenity name

	validates :name, :presence => {:message => "Please enter Amenities (2-30 characters)"}
	validates :name, :format=>{:with=> /^(?:[a-zA-Z0-9\-\s\,\.])*[a-zA-Z](?:[a-zA-Z0-9\-\s\,\.])*$/, :message=>"Amenities can be alphanumeric"}
	validates :name,:length=>{:minimum=>2,:message => "Please enter Amenities(2-30 characters)"}
	validates :name,:length=>{:maximum=>30,:message => "Too long! Maximum 30 characters"}
	validates_uniqueness_of :name, :message => "Amenity name Already Exists"  
end
