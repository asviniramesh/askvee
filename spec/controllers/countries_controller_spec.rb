require 'spec_helper'

describe CountriesController do
	
		describe "countries Controller for the askvee" do

	
	 before(:each) do
		   @attr = {
		   :name => "India"
				}
		@countries=Country.all
    @roles=Role.all
		 end
		 
		 it "should get before_filtered for authorized_user" do
			controller.stub!(:authorized_user).and_return(true)
		end
		
		it "should get list of countries when not search item is match" do
					Country.stub(:order).with("created_at ASC")
			end
			
		it "should get name of the countries when search item is match" do
			Country.stub(:order).with("created_at ASC")
		end
		
	 it "should show country details" do
			Country.stub(:find).with(1)
	end
	 
		it "should have record not found" do
			get "show",:controller => "countries", :id => "show",:json_response=>{:success=>false},:format=>:json
		end
		
		it "Should create new Country" do
			     post :create, :name=>"Pakisthan"
       response.status.should == 200
		 end
		 
		 it "Should require country save when creating content" do
		 no_country_name= Country.new(@attr.merge(:name => ""))
			no_country_name.should_not be_valid
			post "create",:controller => "countries", :id => "create",:json_response=>{:failure=>true},:format=>:json
		end
		
		it "Should update country name" do
			@country=Country.stub(:find).with(1)
			@country.stub(:update_attributes).with(:name=>"Australia")
			put "update",:controller => "countries", :id => "update",:json_response=>{:success=>true},:format=>:json
			end
		 
		 it "Should display the country,state and city in drop down" do
			 end
		
	end
	end