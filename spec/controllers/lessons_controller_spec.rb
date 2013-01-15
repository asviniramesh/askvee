require 'spec_helper'

describe LessonsController do
		describe "Lesson Controller for the askvee" do
		it "should get before_filtered for current_user" do
			controller.stub!(:current_user).and_return(true)
		end
					
			def mock_lesson(stubs={})
    @mock_lesson ||= mock_model(Lesson, stubs).as_null_object
  end

  describe "GET index" do
		
		it "should find the current_user" do
			User.stub(:find_by_id).with(11)
		end
		
	 it "assigns all breakfast as @breakfast" do
	      Lesson.stub(:all) { [mock_dinner] }
	      get :index
	end
end

describe "responding to POST create" do

    describe "with valid params" do
      before(:each) do
        @description = "healthy Food",
				@is_available=true
        @lesson_new = FactoryGirl.build(:break_fast, :description => @description, :is_available => @is_available)
        Lesson.stub!(:new).and_return(@breakfast_new)
				@user=User.new(:parent_id=>"")
      end
			
			it "exposes a newly created dinner as @dinner " do
	
        post :create, :lunch => { :name => ["briyani","rice"], :description => "Healthy and good Food", :is_available => true, :price => 123 ,:currency=>"Dollar"},:json_response=>{:success=>true},:format=>:json

      end
			it "parent id should not be empty when sending mail to franchisee" do
			
				@user.parent_id.should==nil
			end	
		end
	end
	
	describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user " do
        @lesson = FactoryGirl.build(:break_fast, :description => "", :price => "")
        Dinner.stub!(:new).and_return(@lesson)
        post :create, :break_fast => {},:json_response=>{:success=>false},:format=>:json

      end
	
end

describe "responding to GET show" do

    it "should expose the requested user as @user and render [show] template" do
      @breakfast = FactoryGirl.create(:break_fast)
			get :show, :id => @breakfast.id,:json_response=>{:success=>false},:format=>:json
		end
	end
	
	describe "responding to PUT update" do

    describe "with valid params" do

      it "should update Breakfast information" do
				@breakfast_new = FactoryGirl.build(:break_fast, :description => "Neat food", :is_available => false)
        put :update, :id =>:update, :breakfast => { :description => "good food", :is_available => true },:json_response=>{:success=>false},:format=>:json
			end
		end
		
		  describe "responding to DELETE destroy" do

    it "should destroy the requested breakfast" do
      @breakfast = FactoryGirl.create(:break_fast, :id => 2)

      delete:destroy, :id => @breakfast.id,:json_response=>{:success=>false},:format=>:json
		end
	end
	end
end

	end