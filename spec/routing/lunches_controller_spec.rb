require 'spec_helper'

describe LunchesController do
	describe "route recognition for Roles" do
		
		it "should create a  new lunches correctly" do
			{:get => "/lunches/new"}.should route_to(:controller => "lunches", :action => "new")
		end

    it "should generate from show /lunches correctly" do
			{:get => "/lunches/show"}.should route_to(:controller => "lunches", :id=>"show", :action => "show")
		end		

    it "should generate from edit /lunches correctly" do
			{:get => "/lunches/edit"}.should route_to(:controller => "lunches", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /lunches correctly" do
			{:get => "/lunches/index"}.should route_to(:controller => "lunches", :id=>"index", :action => "show")
		end
		
		it "should generate from update /lunches correctly" do
			{:put => "/lunches/update"}.should route_to(:controller => "lunches", :id=>"update", :action => "update")
		end
		
		it "should routes to the create /lunches correctly" do
			{:post=>"/lunches"}.should route_to(:controller => "lunches", :action => "create")
		end
		
	end
end
