class RoomBooking < ActiveRecord::Base
	belongs_to :accommodation
	belongs_to :user
	belongs_to :room
	has_one:payment
	attr_accessor :commit
	attr_accessible :commit, :room_id, :check_in, :check_out,:guest_id, :no_of_person, :actual_rate, :host_id, :is_amount_paid, :no_of_days
	scope :is_booked, proc {|ck_in,ck_out,is_accept| {:conditions => ["check_in >= ? AND check_out <= ? AND is_accepted=?",ck_in,ck_out,is_accept]}}
	scope :is_room, proc {|ck_in,ck_out| {:conditions => ["check_in >= ? AND check_out <= ?",ck_in,ck_out]}}
	
	def self.find_is_booked (room,ck_in,ck_out,is_accept)
	 room_booking = RoomBooking.where("room_id=? AND check_in >= ? AND check_out <= ? AND is_accepted=?",room,ck_in,ck_out,is_accept)
	 return room_booking
	end
	
	def self.find_is_room(room,check_in,check_out)
		room = RoomBooking.where("room_id=? AND check_in >= ? AND check_out <= ?",room,check_in,check_out)
		return room
	end
	
	def self.feedback
		 send_feedback=self.find(:all,:conditions=>["check_out in (?) and is_accepted in (?)",Date.today(),true])
		 return send_feedback
		end
	
end
