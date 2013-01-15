require 'spec_helper'

describe LocationsController do
	
		describe "locations Controller for the askvee" do

	
	 before(:each) do
		   @attr = {
		   :name => "saidapet",
       :city_id=> 1			 
			 }
		 end
		 
		 it "should get before_filtered for authorized_user" do
			controller.stub!(:authorized_user).and_return(true)
		end
		
		it "should get list of locations when not search item is match" do
			Location.stub(:order).with("created_at ASC")
			end
			
		it "should get name of the location when search item is match" do
			Location.stub(:order).with("created_at ASC")
		end
		
	 it "should show location details" do
			Location.stub(:find).with(1)
	end
	 
		it "should have record not found" do
			get "show",:controller => "locations", :id => "show",:json_response=>{:success=>false},:format=>:json
		end
		
		it "Should create new Location" do
			     post :create, :name=>"mambalam",:city_id=>1
       response.status.should == 200
		 end
		 
		 it "Should require Location save when creating location" do
		 no_location_name= Location.new(@attr.merge(:name => ""))
			no_location_name.should_not be_valid
			post "create",:controller => "locations", :id => "create",:json_response=>{:failure=>true},:format=>:json
		end
		
		it "Should update location name" do
			@location=Location.stub(:find).with(1)
			@location.stub(:update_attributes).with(:name=>"saidapet")
			put "update",:controller => "locations", :id => "update",:json_response=>{:success=>true},:format=>:json
			end
		 
		
	end
	end