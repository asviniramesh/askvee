class Role < ActiveRecord::Base
	has_many :user_roles
	has_many :users, :through => :user_roles
	
	#validation for Role name
  validates :name, :presence => {:message => "Please enter Role Name (2-30 characters)"}

	#validates :name, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"Role name can only contain Alphabets"}
	validates :name, :format=>{:with =>/^[a-zA-Z\s\-']+$/,:message => "Role name can only contain Alphabets"}
	validates :name,:length=>{:minimum=>2,:message => "Please enter Role Name (2-30 characters)"}
	validates :name,:length=>{:maximum=>30,:message => "Too long! Maximum 30 characters"}
	validates_uniqueness_of :name, :message => "Role name already exists"
	

end
