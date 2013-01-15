class Location < ActiveRecord::Base
  belongs_to :city
	belongs_to :room
	belongs_to :country
  has_many :users,:class_name => "User", :foreign_key=>'location_id'
	attr_accessor:state_id,:step
	attr_accessible :country_id, :area_code
	#validation for Location Name 
	#validates :name, :presence => {:message => "Please enter Location Name (2-20 characters)"}
	#validates :name,:length=>{:minimum=>2,:message => "Please enter Location Name (2-20 characters)"}
	#validates :name,:length=>{:maximum=>20,:message => "Too long! Maximum 20 characters"}
	#validates_uniqueness_of :name, :message => "Location Name already exists"
	#validates :name, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"Location can be only alphabets"}
	
	#validation for Location Area Code
	validates :area_code, :presence => {:message => "Please enter Area Code"}
	validates :area_code, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"Area Code can be only alphabets"}
	#validates :area_code, :numericality=>{:message=>"Area Code must be numbers"}
	validates :area_code,:length=>{:minimum=>2,:message => "Area Code too short! Must be at least 2 characters"}
	validates :area_code,:length=>{:maximum=>20,:message => "Too long! Maximum 20 characters"}
	validates_uniqueness_of :area_code, :message => "Area Code already exists"
	
	
	#validation for City
	 validates :country_id, :presence => {:message => "Please select country"},:if => Proc.new { |at| at.step!="1" }
	#validates :state_id, :presence => {:message => "Please select state"},:if => Proc.new { |at| at.step!="1" }
	#validates :city_id, :presence => {:message => "Please select city"}
end
