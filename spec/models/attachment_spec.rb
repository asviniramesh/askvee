require 'spec_helper'

describe Attachment do
  
	before(:each) do
		@attach = Attachment.new(
					      :attachable_id => "1",
					      :attachable_type => "", 
					      :image_file_name => "", 
					      :image_content_type => "", 
					      :image_file_size => "", 
					      :image_updated_at => "", 
					      :created_at => "",
					      :updated_at => ""
					      )

	end
		
		it "should have atleast one room attachment" do
			@attach.should respond_to(:attachable)
		end
	
 end
 