class Payment < ActiveRecord::Base
	belongs_to:room_booking
	validates:type_of_card,:presence=>{:message=>"Type of card can not be blank"}
	validates:card_number,:presence=>{:message=>"Card number Can not be blank"}
	validates :card_number,:format=>{:with =>/^[0-9]+$/,:message => "Numbers only accepted"}
	validates:card_number,:length=>{:minimum=>15,:message=>"Card number must be 15 digits"}
	validates:expiry_date,:presence=>{:message=>"Expiry date can not be blank"}
	validates:cvv_number,:presence=>{:message=>"CVV field can not be blank"}
	validates :cvv_number,:format=>{:with =>/^[0-9]+$/,:message => "Numbers only accepted"}
	validates:name_as_on_card,:presence=>{:message=>"Card name Can not be blank"}
	validates:name_as_on_card,:format=>{:with =>/^[a-zA-Z\s\-']+$/,:message => "Name can only contain letters, apostrophe or hyphen."}
	validates:amount,:presence=>{:message=>"Amount can not be blank"}
	
	def self.calculate_no_of_days(check_in,check_out)
	return ((check_out).to_date - (check_in).to_date).to_i
	end

end
