require 'spec_helper'

describe CitiesController do
	
		describe "cities Controller for the askvee" do

	
	 before(:each) do
		   @attr = {
		   :name => "chennai",
			 :state_id =>1
				}
		 end
		 
		 it "should get before_filtered for authorized_user" do
			controller.stub!(:authorized_user).and_return(true)
		end
		
		it "should get list of cites when not search item is match" do
						City.stub(:order).with("created_at ASC")
			end
			
		it "should get name of the city when search item is match" do
			City.stub(:order).with("created_at ASC")
		end
		
	 it "should show city details" do
			City.stub(:find).with(1)
	end
	 
		it "should have record not found" do
			get "show",:controller => "cities", :id => "show",:json_response=>{:success=>false},:format=>:json
		end
		
		it "Should create new City" do
			     post :create, :name=>"madurai"
       response.status.should == 200
		 end
		 
		 it "Should require city save when creating city" do
		 no_city_name= City.new(@attr.merge(:name => ""))
			no_city_name.should_not be_valid
			post "create",:controller => "cities", :id => "create",:json_response=>{:failure=>true},:format=>:json
		end
		
		it "Should update city name" do
			@city=City.stub(:find).with(1)
			@city.stub(:update_attributes).with(:name=>"kovai")
			put "update",:controller => "cities", :id => "update",:json_response=>{:success=>true},:format=>:json
			end
		 
		
	end
	end