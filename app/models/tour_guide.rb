class TourGuide < Room
	#Associations
	belongs_to :user, :foreign_key=>'host_id'
  has_many :attachments, :as => :attachable,:dependent => :destroy
  belongs_to:category
	serialize :name
	attr_accessible :type, :name, :price, :is_available, :description, :is_specific_location, :currency,:is_approved,:approver_id,:comment
	
	#validation for description and name
	validates :description, :presence => {:message =>"Tour description Can not be blank" }
	validates :description, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"Alphabets only accepted"}
	#~ validates :name, :presence => {:message => }
	
	
	#validation for  Available and price
	validates_inclusion_of :is_available, :in => [true, false],:message=>"Availability Can not be blank"
	 validates_inclusion_of :is_specific_location, :in => [true, false],:message=>"Specific Location Can not be blank"
	validates :price, :presence => {:message => "Price details Can not be blank"}
	validates :price,:numericality=>{:message=>"Price must be numbers"}
	validates:currency,:presence=>{:message=>"Currency can not be blank"}
	
	#validation for Name
	 validates_each :name do |record, attr, value|
     problems = ''
	   value.each do |name_url| 
       if name_url== ""
          problems = "Enter the offered location name"
		    else
        end
		 end
		record.errors.add(:name, problems) if problems != ''
	end
end