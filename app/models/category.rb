class Category < ActiveRecord::Base
	 has_many :user_categories
	 has_many :users,:through=>:user_categories
	 has_many:rooms,:foreign_key=>'category_id'
	 belongs_to :message
	#validation for category
	validates :name, :presence => {:message => "Enter the Category name"}
 validates :name, :format=>{:with => /^[a-zA-z\s]+$/,:message=>"Category name can only be alphabets"}
	end
