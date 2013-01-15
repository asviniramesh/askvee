require 'spec_helper'

describe DinnersController do
		describe "Dinner Controller for the askvee" do
		it "should get before_filtered for current_user" do
			controller.stub!(:current_user).and_return(true)
		end
					
			def mock_dinner(stubs={})
    @mock_dinner ||= mock_model(Dinner, stubs).as_null_object
  end

  describe "GET index" do
		
		it "should find the current_user" do
			User.stub(:find_by_id).with(11)
		end
		
	 it "assigns all dinner as @dinner" do
	      Dinner.stub(:all) { [mock_dinner] }
	      get :index
	end
end

describe "responding to POST create" do

    describe "with valid params" do
      before(:each) do
        @description = "healthy Food",
				@is_available=true
        @dinner_new = FactoryGirl.build(:dinner, :description => @description, :is_available => @is_available)
        Dinner.stub!(:new).and_return(@dinner_new)
				@user=User.new(:parent_id=>"")
      end
			
			it "exposes a newly created dinner as @dinner " do
	
        post :create, :dinner => { :name => ["chappathi"], :description => "Healthy and good Food", :is_available => true, :price => 123 ,:currency=>"Dollar"},:json_response=>{:success=>true},:format=>:json

      end
			it "parent id should not be empty when sending mail to franchisee" do
			
				@user.parent_id.should==nil
			end	
		end
	end
	
	describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user " do
        @dinner = FactoryGirl.build(:dinner, :description => "", :price => "")
        Dinner.stub!(:new).and_return(@dinner)
        post :create, :dinner => {},:json_response=>{:success=>false},:format=>:json

      end
	
end

describe "responding to GET show" do

    it "should expose the requested user as @user and render [show] template" do
      @dinner = FactoryGirl.create(:dinner)
			get :show, :id => @dinner.id,:json_response=>{:success=>false},:format=>:json
		end
	end
	
	describe "responding to PUT update" do

    describe "with valid params" do

      it "should update Dinner information" do
				@dinner_new = FactoryGirl.build(:dinner, :description => "Neat food", :is_available => false)
        put :update, :id =>:update, :dinner => { :description => "good food", :is_available => true },:json_response=>{:success=>false},:format=>:json
			end
		end
		
		  describe "responding to DELETE destroy" do

    it "should destroy the requested dinner" do
      @dinner = FactoryGirl.create(:dinner, :id => 2)

      delete:destroy, :id => @dinner.id,:json_response=>{:success=>false},:format=>:json
		end
	end
	end
end

	end