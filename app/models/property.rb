class Property < ActiveRecord::Base
	
	#Association
	has_one :accomodation
	validates:property_type,:presence=>{:message=>"Enter the Property type"}
	#validates_associated :accomodation
end
