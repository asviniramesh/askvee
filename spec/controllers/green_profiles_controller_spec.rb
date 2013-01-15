require 'spec_helper'

describe GreenProfilesController do
	
		describe "GreenProfile Controller for the askvee" do

	
	 before(:each) do
		   @attr = {
		   :name => "Do u have water facility?",	
				}
		 end
		 
		 it "should get before_filtered for authorized_user" do
			controller.stub!(:authorized_user).and_return(true)
		end
		
		it "should get list of green_profiles when not search item is match" do
						GreenProfile.stub(:order).with("created_at ASC")
			end
			
		it "should get name of the green_profiles when search item is match" do
			GreenProfile.stub(:order).with("created_at ASC")
		end
		
	 it "should show green_profiles details" do
			GreenProfile.stub(:find).with(1)
	end
	 
		it "should have record not found" do
			get "show",:controller => "green_profiles", :id => "show",:json_response=>{:success=>false},:format=>:json
		end
		
		it "Should create new GreenProfile" do
			     post :create, :name=>"Do u have tv"
       response.status.should == 200
		 end
		 
		 it "Should require GreenProfile save when creating content" do
		 no_green_profile_name= GreenProfile.new(@attr.merge(:name => ""))
			no_green_profile_name.should_not be_valid
			post "create",:controller => "green_profiles", :id => "create",:json_response=>{:failure=>true},:format=>:json
		end
		
		it "Should update green_profiles name" do
			@green_profiles=GreenProfile.stub(:find).with(1)
			@green_profiles.stub(:update_attributes).with(:content=>"Do u have Tv?")
			put "update",:controller => "green_profiles", :id => "update",:json_response=>{:success=>true},:format=>:json
			end
		 
		
	end
	end