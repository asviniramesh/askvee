class Feedback < ActiveRecord::Base
	validates :role_type, :presence => {:message => "Please select your Role"}
	validates :rating, :presence => {:message => "Please select Rating number"}
	validates :description, :presence => {:message => "Please enter the some remarks"}
	validates :description, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"Remarks can be only alphabets"}
	validates :description, :length=>{:minimum=>2, :message=>"Remarks too short! Must be at least 2 characters"}
	validates :description, :length=>{:maximum=>300, :message=>"Too long! Maximum 300 characters"}
end
