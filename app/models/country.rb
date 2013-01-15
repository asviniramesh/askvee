class Country < ActiveRecord::Base
	has_many :states, :dependent => :destroy
	has_many :locations, :dependent => :destroy
  has_many :users,:class_name => "User", :foreign_key=>'country_id'
	
	#validation for Country name
	validates :name, :presence => {:message => "Please enter Country Name (2-15 characters)"}
	validates_uniqueness_of :name, :message => "Country Name Already Exists"
	validates :name, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"Country Name can be only alphabets"}
	validates_length_of :name, :maximum => 15, :message => "Too long! Maximum 15 characters"
	validates_length_of :name, :minimum => 2,:message => "Please enter Country Name (2-15 characters)"
end
