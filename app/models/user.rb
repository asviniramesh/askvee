class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :confirmable, :token_authenticatable, :authentication_keys => [:login]

 has_many :user_categories
 has_many :rooms, :foreign_key=>:host_id
 has_many :categories,:through=>:user_categories
  # Setup accessible (or protected) attributes for your model
  attr_accessor :step, :role_id, :terms_of_service, :login

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name,:last_name, :home_phone, :mobile_phone, :location_id, :city_id, :state_id, :country_id,:step,:user_name,:address,:area_code,  :is_rejected, :is_accepted, :parent_id, :permalink, :confirmed_at, :role_id,:user_name,:current_password,:new_password,:confirm_password,:terms_of_service,:state_name, :city_name, :login,:addressline2,:provider, :uid, :authentication_token


 has_many :profiles, :class_name => "Profile", :foreign_key=>'owner_id'
 has_one :contact_detail,:as => :attachable  
 has_one :attachment, :as => :attachable,:dependent => :destroy  
 has_many :room_bookings, :class_name => "RoomBooking", :foreign_key=>'guest_id'
 
 #~ has_many :post_ads,:class_name => "Room",:foreign_key=>'host_id'
 
 has_many :user_roles

 has_many :roles, :through => :user_roles
 has_many :inbox, :class_name=>"Message", :foreign_key=>:receiver_id
 has_many :outbox, :class_name=>"Message", :foreign_key=>:sender_id
 belongs_to :city
 belongs_to :state
 belongs_to :country
 belongs_to :location
 
 has_many :break_fasts, :foreign_key=>'host_id'
 has_many :post_ads, :class_name=>"Room", :foreign_key=>'host_id'
 has_many :dinners, :foreign_key=>'host_id'
 has_many :tour_guides, :foreign_key=>'host_id'
 has_many :accommodations, :foreign_key=>'host_id'
 has_many :lunches, :foreign_key=>'host_id'
 has_many :lessons, :foreign_key=>'host_id'

#~ has_many:lunches,:foreign_key=>'host_id',:class_name=>'Room'


 #validations for role
  validates :role_id, :presence => {:message => "Please select your role"}, :if => Proc.new { |at| at.step!="1" && at.step!="2" && at.step!="4" && at.step!="7" && at.step!="8"}
 #validations for email and password
  validates :email, :presence => {:message => "Please enter a valid email address"}, :if => Proc.new { |at| at.step!="1" && at.step!="7" && at.step!="8"}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i , :message => "Please enter a valid email address", :if => Proc.new { |at| at.step!="7" && at.step!="8"}
  validates_uniqueness_of :email, :message => "Sorry,this email address has already been used!"
  validates :password, :presence => {:message => "Please enter your password (6-32 characters)"}, :if => Proc.new { |at| at.step!="1" && at.step!="7"  && at.step!="8"}
  validates :password, :length=>{:minimum =>6,:message => "Please enter your password (6-32 characters)"}, :if => Proc.new { |at| at.step!="1" && at.step!="7" && at.step!="8"}
  validates :password, :length=>{:maximum =>32,:message => "Too long! Maximum 32 characters"}, :if => Proc.new { |at| at.step!="1" }
  #~ validates :password_confirmation, :presence => {:message => "Please enter password (6-32 characters)"}, :if => Proc.new { |at| at.step!="1" }
  validates :password_confirmation, :presence => {:message => "Password mismatch"},:if => Proc.new { |at| at.step!="1" && at.step!="7" && at.step!="8"}
  #~ validates :password, :format=>{:with =>/^(?:[a-zA-Z0-9])*[a-zA-Z](?:[a-zA-Z0-9])*$/,:message => "Password should be combination of Alphanumeric"}, :if => Proc.new { |at| at.step!="1" }
  validates :password, :format=>{:with => /^([a-zA-Z_]{1,}\d{1,})+|(\d{1,}[a-zA-Z_]{1,})+$/,:message => "Password should be combination of Alphanumeric"}, :if => Proc.new { |at| at.step!="1" && at.step!="7" && at.step!="8"}
  validates_confirmation_of :password,:message => "Password mismatch"
  validates_confirmation_of :password_confirmation
  
  
 
  
  #validations for first name, last name and username
  validates :first_name, :presence => {:message => "Please enter first name (2-40 characters)"},:if => Proc.new { |at| at.first_name.blank? },:if => Proc.new { |at| at.step!="2"  && at.step!="4" && at.step!="8"}
  validates :first_name,:length=>{:minimum=>2,:message => "Please enter first name (2-40 characters)"},:if => Proc.new { |at| !at.first_name.blank? }
  validates :first_name,:length=>{:maximum=>40,:message => "Too long! Maximum 40 characters"},:if => Proc.new { |at| !at.first_name.blank? }
	validates :first_name,:format=>{:with =>/^[a-zA-Z\s\-']+$/,:message => "First name can only contain letters, apostrophe or hyphen."},:if => Proc.new { |at| !at.first_name.blank? }
  
  validates :last_name, :presence => {:message => "Please enter last name (2-40 characters)"},:if => Proc.new { |at| at.first_name.blank? },:if => Proc.new { |at| at.step!="2"  && at.step!="4" && at.step!="8"}
  validates :last_name,:length=>{:minimum=>2,:message => "Please enter last name (2-40 characters)"},:if => Proc.new { |at| !at.last_name.blank? }
  validates :last_name,:length=>{:maximum=>40,:message => "Too long! Maximum 40 characters"},:if => Proc.new { |at| !at.last_name.blank? }
	validates :last_name,:format=>{:with =>/^[a-zA-Z\s\-']+$/,:message => "Last name can only contain letters, apostrophe or hyphen."},:if => Proc.new { |at| !at.last_name.blank? }
  
  validates :user_name, :presence => {:message => "User id can not be blank"}, :if => Proc.new { |at| at.step!="8"}
	validates :user_name,:length=>{:in=>2..40,:message => "Please enter user name (2-40 characters)"}
	validates :user_name,:format=>{:with =>/^[a-zA-Z\s\-']+$/,:message => "User id can only contain letters, apostrophe or hyphen"}, :if => Proc.new { |at| at.step!="8"}
  validates_uniqueness_of :user_name, :message => "User name Already Exists"
  
  #validations for home phone and mobile phone
  validates :area_code, :presence => {:message => "Please enter zip code"} ,:if => Proc.new { |at| at.area_code.blank?} ,:if => Proc.new { |at| at.step!="2" && at.step!="3" && at.step!="7" && at.step!="8"}
  validates :area_code ,:format=>{:with=>/^[0-9]+$/,:message=>"Zip code must be numbers"},:if => Proc.new { |at| at.step!="2" && at.step!="3" && at.step!="7" && at.step!="8"}
  validates :area_code,:length=>{:minimum=>2,:message => "Zip code too short! Must be at least 2 numbers"},:if => Proc.new { |at| at.step!="2" && at.step!="3" && at.step!="7" && at.step!="8"}
  validates :area_code,:length=>{:maximum=>10,:message => "Too long! Maximum 10 digits"},:if => Proc.new { |at| at.step!="2" && at.step!="3" && at.step!="7" && at.step!="8"}
  
  validates :user_name,:length=>{:in=>2..40,:message => "Please enter user name (2-40 characters)"}
  
  validates :home_phone, :presence=>{:message=>"Please enter home phone number (8-15) digits"},:if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"} 
  validates :home_phone, :format=>{:with => /^[[0-9]\+]+$/, :message => "Phone number can only contain numbers and '+'" },:if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
	validates :home_phone, :length=>{:minimum=>8, :message=>"Home phone number too short! Must be at least 8 digits."},:if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
	validates :home_phone, :length=>{:maximum=>15, :message=>"Too long! Maximum 15 digits"},:if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
  
  
  validates :mobile_phone, :presence=>{:message=>"Please enter mobile phone number (8-15) digits"},:if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"} 
  validates :mobile_phone, :format => { :with => /^[[0-9]\+]+$/, :message => "Phone number can only contain numbers and '+'" }, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
  validates :mobile_phone, :length=>{:minimum=>8, :message=>"Mobile phone number too short! Must be at least 8 digits."},:if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
	validates :mobile_phone, :length=>{:maximum=>15, :message=>"Too long! Maximum 15 digits"},:if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}

 
 #validations for Address
  validates :address, :presence=>{:message=>"Please enter address and number"}, :if => Proc.new { |at| at.address.blank? && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"} 

	validates :address, :length=>{:minimum=>2, :message=>"Address too short! Must be at least 2 characters"},:if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
	validates :address, :length=>{:maximum=>40, :message=>"Too long! Maximum 40 characters"},:if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
  validates :address, :format => { :with =>  /^(?:[a-zA-Z0-9\-\s\,\.])*[a-zA-Z](?:[a-zA-Z0-9\-\s\,\.])*$/, :message => "Address name must have some letters!" }, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
  
   validates :addressline2, :presence=>{:message=>"Please enter address and number"}, :if => Proc.new { |at| at.address.blank? && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"} 

	validates :addressline2, :length=>{:minimum=>2, :message=>"Address too short! Must be at least 2 characters"},:if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
	validates :addressline2, :length=>{:maximum=>40, :message=>"Too long! Maximum 40 characters"},:if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
  validates :addressline2, :format => { :with =>  /^(?:[a-zA-Z0-9\-\s\,\.])*[a-zA-Z](?:[a-zA-Z0-9\-\s\,\.])*$/, :message => "Address name must have some letters!" }, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
   #validations of country, state, city, location
 validates :country_id, :presence=>{:message=>"Please select your country"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
 #validates :state_id, :presence=>{:message=>"Please select your state"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4"}          
 #validates :city_id, :presence=>{:message=>"Please select your city"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4"}
 #validates :state_name, :presence=>{:message=>"Please enter the state"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4"}   
# validates :city_name, :presence=>{:message=>"Please enter the city"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4"}

 validates :location_id, :presence=>{:message=>"Please select area code"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}

 #validates :state_name,:format=>{:with =>/^[a-zA-Z\s\]+$/,:message => "State name can only contain letters."}
 
 validates :state_name, :presence => {:message => "Please enter state name (2-20 characters)"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}

	validates :state_name, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"State can be only alphabets"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
	validates :state_name,:length=>{:minimum=>2,:message => "Please enter State Name (2-20 characters)"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
	validates :state_name,:length=>{:maximum=>20,:message => "Too long! Maximum 20 characters"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
	#validates_uniqueness_of :state_name, :message => "State Name already exists", :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4"}
  
  validates :city_name, :presence => {:message => "Please enter city name (2-20 characters)"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
	validates :city_name,:length=>{:minimum=>2,:message => "Please enter City Name (2-20 characters)"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
	validates :city_name,:length=>{:maximum=>20,:message => "Too long! Maximum 20 characters"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
	#validates_uniqueness_of :city_name, :message => "City Name already exists", :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4"}
	validates :city_name, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"City can be only alphabets"}, :if => Proc.new { |at| at.step!="2" && at.step!="3"  && at.step!="4" && at.step!="7" && at.step!="8"}
  
   
  
 validates :terms_of_service, :presence=>{:message=> "Please agree the terms & conditions"}, :if => Proc.new { |at| at.step!="4" && at.step!="1" && at.step!="7" && at.step!="8"}
 
 #~ validates:new_password,:presence=>{:message=>"Please enter your current password (6 - 32 characters)"},:if => Proc.new { |at| at.step!="1" }
 #~ validates:confirm_password,:presence=>{:message=>"Please enter your current password (6 - 32 characters)"},:if => Proc.new { |at| at.step!="1" }
 
def validate_password(params)
    self.errors.add(:current_password, "Please enter your current password (6 - 32 characters)") if params[:current_password].length<6
    self.errors.add(:current_password, "Please enter your current password") unless self.valid_password?(params[:current_password])
    self.errors.add(:password, "Please enter your new password (6 - 32 characters)") if params[:new_password].length <6 
    self.errors.add(:password, "Password should be combination of Alphanumeric") unless params[:new_password]=~/^([a-zA-Z_]{1,}\d{1,})+|(\d{1,}[a-zA-Z_]{1,})+$/
    self.errors.add(:password_confirmation, "Please re-enter your new password (6 - 32 characters)") if params[:confirm_password].length <6
    self.errors.add(:password_confirmation, "Password should be combination of Alphanumeric")  unless params[:new_password]=~/^([a-zA-Z_]{1,}\d{1,})+|(\d{1,}[a-zA-Z_]{1,})+$/
    self.errors.add(:password, "Sorry, that password doesn't match. Please try again.") if params[:new_password]!=params[:confirm_password] && params[:confirm_password].length!=0
    
  end


 
  def self.list_of_guest_host(role,from_date,to_date)
    return user = role.users("created_at between ? and ?", from_date, to_date)
  end
 
 
  def self.find_post_advertisement(parent_id)
      u  = User.where("parent_id=?",parent_id)
      rooms = []
      u.each do |a|
      rooms <<  a.post_ads
        rooms.flatten!
        return rooms
      end
  end
 
  def self.list_franchisee_rooms_bookings(parent_id)
    room = self.find_post_advertisement(parent_id)
    room_bookings = []
    room.each do |rm|
      room_bookings  << rm.room_bookings
      room_bookings.flatten!
    end
    return room_bookings 
  end


  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #where(conditions).where(["lower(user_name) = :value", { :value => login.downcase }]).first
      where(conditions).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
   end
   
  #It will change the current password
  def update_password(params)
    self.update_attributes(:password=>params[:new_password], :password_confirmation=>params[:confirm_password],:step=>"1")
   end
   
  def updatePassword(params)
    self.update_attributes(:password=>params[:new_password], :password_confirmation=>params[:confirm_pwd],:step=>"2")
   end

end


