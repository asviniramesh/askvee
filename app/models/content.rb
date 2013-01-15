class Content < ActiveRecord::Base
	
	#validation for Content name and Description
	validates :name, :presence => {:message => "Please enter Content Name (2-20 characters)"}
	validates :name,:length=>{:minimum=>2,:message => "Please enter Content Name (2-20 characters)"}
	validates :name,:length=>{:maximum=>20,:message => "Too long! Maximum 20 characters"}
	validates :name, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"Content can be only alphabets"}
	validates :description, :presence => {:message => "Please enter Content Description (2-100 characters)"}
	validates :description, :format=>{:with=>/^[a-zA-Z\s]+$/,:message=>"Content Description can be only alphabets"}
	validates :description,:length=>{:minimum=>2,:message => "Please enter Content Description (2-100 characters)"}
	validates :description,:length=>{:maximum=>100,:message => "Too long! Maximum 100 characters"}
end
