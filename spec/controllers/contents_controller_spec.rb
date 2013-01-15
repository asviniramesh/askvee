require 'spec_helper'

describe ContentsController do
	
		describe "contents Controller for the askvee" do

	
	 before(:each) do
		   @attr = {
		   :name => "Terms and service",	
			 :description=>"i agree private policy"
				}
		 end
		 
		 it "should get before_filtered for authorized_user" do
			controller.stub!(:authorized_user).and_return(true)
		end
		
		it "should get list of contents when not search item is match" do
						Content.stub(:order).with("created_at ASC")
			end
			
		it "should get name of the content when search item is match" do
			Content.stub(:order).with("created_at ASC")
		end
		
	 it "should show content details" do
			Content.stub(:find).with(1)
	end
	 
		it "should have record not found" do
			get "show",:controller => "contents", :id => "show",:json_response=>{:success=>false},:format=>:json
		end
		
		it "Should create new Content" do
			     post :create, :conent=>"About us",:description=>"I agree private policy"
       response.status.should == 200
		 end
		 
		 it "Should require content save when creating content" do
		 no_content_name= Content.new(@attr.merge(:name => "",:description=>""))
			no_content_name.should_not be_valid
			post "create",:controller => "contents", :id => "create",:json_response=>{:failure=>true},:format=>:json
		end
		
		it "Should update content name" do
			@content=Content.stub(:find).with(1)
			@content.stub(:update_attributes).with(:content=>"about us",:description=>"Askvee")
			put "update",:controller => "contents", :id => "update",:json_response=>{:success=>true},:format=>:json
			end
		 
		
	end
	end