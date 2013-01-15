class Dinner < Room
	#Associations
        belongs_to :user, :foreign_key=>'host_id'
  has_many :attachments, :as => :attachable,:dependent => :destroy
  belongs_to:category
        serialize :name
        attr_accessible :type, :name, :price, :is_available, :description,:currency,:is_approved,:approver_id,:comment
        
        #validation for description and name
        validates :description, :presence => {:message => "Dinner description Can not be blank"}
        validates :description, :format=>{:with=>/^[a-zA-Z\s]+$/, :message=>"Alphabets only accepted"}
        #~ validates :name, :presence => {:message => APP_MESSAGE["dinner_name_empty"]}
        
        
        #validation for Food Available and price
        validates :price, :presence => {:message =>"Price details Can not be blank"}
        validates :price,:numericality=>{:message=>"Price must be numbers"}
        validates_inclusion_of :is_available, :in => [true, false],:message=>"Availability Can not be blank"
        validates:currency,:presence=>{:message=>"Currency can not be blank"}
        #validation for Name
         validates_each :name do |record, attr, value|
     problems = ''
           value.each do |name_url| 
       if name_url== ""
          problems = " Enter the Dinner name"
                    else
        end
                 end
                record.errors.add(:name, problems) if problems != ''
        end

	
end
