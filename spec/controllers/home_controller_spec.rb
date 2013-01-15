require 'spec_helper'

describe HomeController do
	
		describe "home Controller for the askvee" do
			
				 before(:each) do
		   @attr = {
		   :user_name => "askvee",	
			 :password=>"123456",
			  :email=>"akvee@gmail.com"
				}
				@user=User.new(@attr)
		 end
		 
			
			it "should get before_filtered for authorized_user" do
			controller.stub!(:authorized_user).and_return(true)
		end
		
		it "Should cancel the registration for askvee" do
      @user=User.stub(:find_by_id).with(1)
			@user.stub(:update_attributes).with(:is_rejected => "true").and_return(true)
			@user.stub(:save).with(:validate => "false").and_return(true)
			get "registration_cancellation",:controller => "home", :action=> "registration_cancellation",:json_response=>{:success=>true},:format=>:json
		end
		
		it "should approve the ad"do
			@room=Room.stub(:find_by_id).with(1)
			@room.stub(:update_attributes).with(:is_approved => "true").and_return(true)
			@room.stub(:save).and_return(true)
		end
		
		it "Should invite the Franchisee" do
			@invite_franchisee= User.new(:confirmed_at =>"")
			@invite_franchisee.stub(:save).with(:validate => "false").and_return(true)
		end

		
		it "should list of franchisee" do
			role=Role.stub(:find_by_name).with('Franchisee')
			end
		 
		it "should list of host" do
			role=Role.stub(:find_by_name).with('Host')
		end
		
				it "should list of Guest" do
			role=Role.stub(:find_by_name).with('Guest')
			end
		end
	end
	