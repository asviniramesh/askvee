require 'spec_helper'

describe AmenitiesController do
	
		describe "amenities Controller for the askvee" do

	
	 before(:each) do
		   @attr = {
		   :name => "Tv"
				}
		 end
		 
		 it "should get before_filtered for authorized_user" do
			controller.stub!(:authorized_user).and_return(true)
		end
		
		it "should get list of amenities when not search item is match" do
						Amenity.stub(:order).with("created_at ASC")
			end
			
		it "should get name of the amenity when search item is match" do
			Amenity.stub(:order).with("created_at ASC")
		end
		
	 it "should show amenity details" do
			Amenity.stub(:find).with(1)
	end
	 
		it "should have record not found" do
			get "show",:controller => "amenities", :id => "show",:json_response=>{:success=>false},:format=>:json
		end
		
		it "Should create new Amenity" do
			     post :create, :name=>"fridge"
       response.status.should == 200
		 end
		 
		 it "Should require amenity save when creating amenity" do
		 no_amenity_name= Amenity.new(@attr.merge(:name => ""))
			no_amenity_name.should_not be_valid
			post "create",:controller => "amenities", :id => "create",:json_response=>{:failure=>true},:format=>:json
		end
		
		it "Should update amenity name" do
			@amenity=Amenity.stub(:find).with(1)
			@amenity.stub(:update_attributes).with(:name=>"fan")
			put "update",:controller => "amenities", :id => "update",:json_response=>{:success=>true},:format=>:json
			end
		 
		
	end
	end