require 'spec_helper'

describe AccountsController do
	
	describe "Accounts Controller for the askvee" do
		before(:each) do
		@current_user = {
		:first_name => "askvee",
		:last_name => "askvee",
		:user_name => "askvee",
		:email => "clashy@example.com",
		:password => "1234567", 
		:password_confirmation => "1234567"
		}
	end
		
		 it "should get before_filtered for authorized_user" do
			controller.stub!(:authorized_user).and_return(true)
		end
		
		it "should show accounts of current_user" do
			@my_accounts=@current_user
		end
		
		it "should update accounts of current_user" do
			@my_accounts=@current_user
      @my_accounts.stub(:update_attributes).with(:user_name=>"admin",:first_name=>"admin",:last_name=>"admin").and_return(false)  
			put "update",:controller => "accounts", :id => "update",:json_response=>{:success=>true},:format=>:json

		end
		
		it "Should success when update accounts of current_user"do
			@current_user.stub(:errors).with(0).and_return(true)    
			end
		
		it "update password  for the askvee" do
			@current_user.stub(:valid_password).with("12345").and_return(true)
			@current_user.stub(:update_password).with(:old_password=>"123456",:password=>"1234567",:confm_pwd=>"1234567")
				put "update_password",:controller => "accounts", :id => "update_password",:json_response=>{:success=>true},:format=>:json

		end
		
		it "should reset password for user" do
			User.stub(:find_by_reset_password_token).with(1)
		end
		end
	end