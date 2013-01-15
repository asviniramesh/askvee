class CalenderUpdate < ActiveRecord::Base
	belongs_to :accommodation
	attr_accessor :commit
	attr_accessible :commit, :accomodation_id, :date, :is_booked, :is_unavailable, :is_available
	serialize :date

	#validation for accomodation and date
	#validates :accomodation_id, :presence=>{:message=>APP_MESSAGE["calendar_update_ad"]}
	validates :date, :presence=>{:message=>APP_MESSAGE["calendar_update_date"]}
	
end
