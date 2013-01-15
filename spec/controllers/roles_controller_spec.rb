require 'spec_helper'

describe RolesController do
	
		describe "roles Controller for the askvee" do

	
	 before(:each) do
		   @attr = {
		   :name => "Franchisee",	
				}
		 end
		 
		 it "should get before_filtered for authorized_user" do
			controller.stub!(:authorized_user).and_return(true)
		end
		
		it "should get list of the roles" do
			Role.stub(:order).with("created_at ASC")
		end
		
	 it "should show Role details" do
			Role.stub(:find).with(1)
	end
	 
		it "should have record not found" do
			get "show",:controller => "roles", :id => "show",:json_response=>{:success=>false},:format=>:json
		end
		
		it "Should create new Role" do
			     post :create, :name=>"Admin"
       response.status.should == 200
		 end
		 
		 it "Should require role save when creating role" do
		 no_role_name= Content.new(@attr.merge(:name => ""))
			no_role_name.should_not be_valid
			post "create",:controller => "roles", :id => "create",:json_response=>{:failure=>true},:format=>:json
		end
		
		it "Should update role name" do
			@role=Role.stub(:find).with(1)
			@role.stub(:update_attributes).with(:name=>"Admin")
			put "update",:controller => "roles", :id => "update",:json_response=>{:success=>true},:format=>:json
			end
		 
		
	end
	end