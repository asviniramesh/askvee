class RoomAmenity < ActiveRecord::Base
	belongs_to :amenity
	belongs_to :accommodations
	#~ serialize :amenity_id
	validates_associated :accommodations
end
