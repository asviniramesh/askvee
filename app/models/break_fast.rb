class BreakFast < Room
	belongs_to :user, :foreign_key=>'host_id'
  has_many :attachments, :as => :attachable,:dependent => :destroy
  belongs_to:category
	serialize :name

	#validation for Description
	validates :description, :presence => {:message => "Breakfast description Can not be blank"}
	validates :description, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"Alphabets only accepted"}
	
	 #validation for Food Available
	 validates_inclusion_of :is_available, :in => [true, false],:message=>"Availability Can not be blank"
	 	 #~ validates:is_available,:presence=>{:message=>"Availability Can not be blank"}

	 #validation for Price
	 validates :price,:presence=>{:message=>"Price details Can not be blank"}
	 validates :price,:numericality=>{:message=>"Price must be numbers"}
	 validates:currency,:presence=>{:message=>"Currency can not be blank"}
	 #~ #validation for Name
	 validates_each :name do |record, attr, value|
     problems = ''
	   value.each do |name_url| 
       if name_url== ""
          problems = "Enter the breakfast name" 
        end
		 end
		record.errors.add(:name, problems) if problems != ''
	end
end
