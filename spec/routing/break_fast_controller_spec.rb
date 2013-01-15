require 'spec_helper'

describe BreakfastsController do
	describe "route recognition for Roles" do
		
		it "should create a  new Breakfast correctly" do
			{:get => "/breakfasts/new"}.should route_to(:controller => "breakfasts", :action => "new")
		end

    it "should generate from show /breakfasts correctly" do
			{:get => "/breakfasts/show"}.should route_to(:controller => "breakfasts", :id=>"show", :action => "show")
		end		

    it "should generate from edit /breakfasts correctly" do
			{:get => "/breakfasts/edit"}.should route_to(:controller => "breakfasts", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /breakfasts correctly" do
			{:get => "/breakfasts/index"}.should route_to(:controller => "breakfasts", :id=>"index", :action => "show")
		end
		
		it "should generate from update /breakfasts correctly" do
			{:put => "/breakfasts/update"}.should route_to(:controller => "breakfasts", :id=>"update", :action => "update")
		end
		
		it "should routes to the create /Roles correctly" do
			{:post=>"/breakfasts"}.should route_to(:controller => "breakfasts", :action => "create")
		end
		
	end
end
