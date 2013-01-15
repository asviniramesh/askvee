require 'spec_helper'

describe LunchesController do
		describe "Lunch Controller for the askvee" do
		it "should get before_filtered for current_user" do
			controller.stub!(:current_user).and_return(true)
		end
					
			def mock_lunch(stubs={})
    @mock_lunch ||= mock_model(Lunch, stubs).as_null_object
  end

  describe "GET index" do
		
		it "should find the current_user" do
			User.stub(:find_by_id).with(11)
		end
		
	 it "assigns all lunch as @lunch" do
	      Lunch.stub(:all) { [mock_lunch] }
	      get :index
	end
end

describe "responding to POST create" do

    describe "with valid params" do
      before(:each) do
        @description = "healthy Food",
				@is_available=true
        @lunch_new = FactoryGirl.build(:lunch, :description => @description, :is_available => @is_available)
        Lunch.stub!(:new).and_return(@lunch_new)
				@user=User.new(:parent_id=>"")
      end
			
			it "exposes a newly created lunch as @lunch " do
	
        post :create, :lunch => { :name => ["briyani","rice"], :description => "Healthy and good Food", :is_available => true, :price => 123 ,:currency=>"Dollar"},:json_response=>{:success=>true},:format=>:json

      end
			it "parent id should not be empty when sending mail to franchisee" do
			
				@user.parent_id.should==nil
			end	
		end
	end
	
	describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user " do
        @lunch = FactoryGirl.build(:lunch, :description => "", :price => "")
        Lunch.stub!(:new).and_return(@lunch)
        post :create, :lunch => {},:json_response=>{:success=>false},:format=>:json

      end
	
end

describe "responding to GET show" do

    it "should expose the requested user as @user and render [show] template" do
      @lunch = FactoryGirl.create(:lunch)
			get :show, :id => @lunch.id,:json_response=>{:success=>false},:format=>:json
		end
	end
	
	describe "responding to PUT update" do

    describe "with valid params" do

      it "should update Lunch information" do
				@lunch_new = FactoryGirl.build(:lunch, :description => "Neat food", :is_available => false)
        put :update, :id =>:update, :lunch => { :description => "good food", :is_available => true },:json_response=>{:success=>false},:format=>:json
			end
		end
		
		  describe "responding to DELETE destroy" do

    it "should destroy the requested lunch" do
      @lunch = FactoryGirl.create(:lunch, :id => 2)

      delete:destroy, :id => @lunch.id,:json_response=>{:success=>false},:format=>:json
		end
	end
	end
end

	end