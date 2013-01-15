class RoomGreenProfile < ActiveRecord::Base

 	#Associations
		belongs_to :accommodation
		belongs_to :green_profile
		#~ serialize :green_profile_id
		validates_associated :accommodation
end
