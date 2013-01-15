require 'spec_helper'

describe LessonsController do
	describe "route recognition for Roles" do
		
		it "should create a  new lessons correctly" do
			{:get => "/lessons/new"}.should route_to(:controller => "lessons", :action => "new")
		end

    it "should generate from show /lessons correctly" do
			{:get => "/lessons/show"}.should route_to(:controller => "lessons", :id=>"show", :action => "show")
		end		

    it "should generate from edit /lessons correctly" do
			{:get => "/lessons/edit"}.should route_to(:controller => "lessons", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /lessons correctly" do
			{:get => "/lessons/index"}.should route_to(:controller => "lessons", :id=>"index", :action => "show")
		end
		
		it "should generate from update /lessons correctly" do
			{:put => "/lessons/update"}.should route_to(:controller => "lessons", :id=>"update", :action => "update")
		end
		
		it "should routes to the create /lessons correctly" do
			{:post=>"/lessons"}.should route_to(:controller => "lessons", :action => "create")
		end
		
	end
end
