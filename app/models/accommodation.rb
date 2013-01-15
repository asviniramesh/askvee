class Accommodation < Room
	#Associations
	has_many :room_bookings,:foreign_key=> 'room_id',:dependent => :destroy
	belongs_to :user, :foreign_key=>'host_id'
	has_many :attachments, :as => :attachable,:dependent => :destroy
	belongs_to:category
	has_many :green_profiles, :through => :room_green_profiles
	has_many :room_green_profiles,:foreign_key=> 'room_id'
  belongs_to :property
	has_many :amenities, :through => :room_amenities
	has_many :room_amenities, :foreign_key=> 'room_id'
  attr_accessible :type, :host_id, :name, :address, :room_type, :description, :price, :is_approved, :approver_id, :green_profile_id, :amenity, :accommodates, :currency, :property_id, :is_available, :area_code,:comment,:length

	#validations
	validates :description, :presence => {:message => APP_MESSAGE["accomodation_description"]}
	validates :description, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"Alphabets only accepted"}
	validates :price, :presence => {:message => APP_MESSAGE["accomodation_price"]}
	validates :price,:numericality=>{:message=>"Price must be numbers"}
	validates :currency, :presence => {:message => APP_MESSAGE["accomodation_currency"]}
	validates :accommodates, :presence => {:message => APP_MESSAGE["accomodation_accommodates"]}
	validates :property_id, :presence => {:message => APP_MESSAGE["accomodation_property"]}
	#~ validates :green_profiles, :presence => {:message => APP_MESSAGE["accomodation_green_profile_question"]}
	#~ validates :room_amenities, :presence => {:message => APP_MESSAGE["accomodation_amenities"]}
	#validates :attachments, :presence => {:message => APP_MESSAGE["accomodation_photo"]}
	validates_inclusion_of :is_available, :in => [true, false],:message=>APP_MESSAGE["accomodation_available"]
	
	#~ validates_associated :green_profiles, :room_green_profiles, :room_amenities
	
		def self.search_result(condition)
		@search_result=self.where(condition).includes(:user,:amenities)
    return @search_result
	end
	end
