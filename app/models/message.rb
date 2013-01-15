class Message < ActiveRecord::Base
 has_one :category
	belongs_to :sender, :class_name=>"User", :foreign_key=>:sender_id
	belongs_to :receiver, :class_name=>"User", :foreign_key=>:receiver_id
	attr_accessor :email 
	attr_accessible :email, :content,:sender_id,:receiver_id, :category
	
	#validation for message
	validates :content, :presence => {:message => "Please enter the message"}
	validates :content,:length=>{:minimum=>2,:message => "Message too short! Must be at least 2 characters"}
	validates :content,:length=>{:maximum=>300,:message => "Too long! Maximum 300 characters"}
  validates :email, :presence => {:message => "Please select email address"}
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i , :message => "Please enter a valid email address"
  validates:receiver_id ,:presence=>{:message=>"Please select user"}
end
