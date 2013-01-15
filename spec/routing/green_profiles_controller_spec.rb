require 'spec_helper'

describe GreenProfilesController do
	describe "route recognition for green_profiles" do
		
		it "should create a  new Green_profiles correctly" do
			{:get => "/green_profiles/new"}.should route_to(:controller => "green_profiles", :action => "new")
		end

    it "should generate from show /Green_profiles correctly" do
			{:get => "/green_profiles/show"}.should route_to(:controller => "green_profiles", :id=>"show", :action => "show")
		end		

    it "should generate from edit /Green_profiles correctly" do
			{:get => "/green_profiles/edit"}.should route_to(:controller => "green_profiles", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /Green_profiles correctly" do
			{:get => "/green_profiles/index"}.should route_to(:controller => "green_profiles", :id=>"index", :action => "show")
		end
		
		it "should generate from update /Green_profiles correctly" do
			{:put => "/green_profiles/update"}.should route_to(:controller => "green_profiles", :id=>"update", :action => "update")
		end
		
		it "should generate from search /Green_profiles correctly" do
			{:put => "/green_profiles/search"}.should route_to(:controller => "green_profiles", :action => "search")
		end
		
		it "should routes to the create /Green_profiles correctly" do
			{:post=>"/green_profiles"}.should route_to(:controller => "green_profiles", :action => "create")
		end
		
	end
end
