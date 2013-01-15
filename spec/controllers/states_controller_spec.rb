require 'spec_helper'

describe StatesController do
	
		describe "states Controller for the askvee" do

	
	 before(:each) do
		   @attr = {
			 :country_id=>1,
		   :name => "Tamilnadu"	
				}
		 end
		 
		 it "should get before_filtered for authorized_user" do
			controller.stub!(:authorized_user).and_return(true)
		end
		
		it "should get list of states when not search item is match" do
				State.stub(:order).with("created_at ASC")
			end
			
		it "should get name of the state when search item is match" do
			State.stub(:order).with("created_at ASC")
		end
		
	 it "should show state details" do
			State.stub(:find).with(1)
	end
	 
		it "should have record not found" do
			get "show",:controller => "states", :id => "show",:json_response=>{:success=>false},:format=>:json
		end
		
		it "Should create new state" do
			     post :create, :name=>"Kerala",:country_id=>1
       response.status.should == 200
		 end
		 
		 it "Should require state save when creating state" do
		 no_state_name= State.new(@attr.merge(:name => ""))
			no_state_name.should_not be_valid
			post "create",:controller => "states", :id => "create",:json_response=>{:failure=>true},:format=>:json
		end
		
		it "Should update state name" do
			@state=State.stub(:find).with(1)
			@state.stub(:update_attributes).with(:name=>"Kerala")
			put "update",:controller => "states", :id => "update",:json_response=>{:success=>true},:format=>:json
			end
		 
		
	end
	end