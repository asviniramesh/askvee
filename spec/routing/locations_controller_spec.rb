require 'spec_helper'

describe LocationsController do
	describe "route recognition for Locations" do
		
		it "should create a  new Locations correctly" do
			{:get => "/locations/new"}.should route_to(:controller => "locations", :action => "new")
		end

    it "should generate from show /Locations correctly" do
			{:get => "/locations/show"}.should route_to(:controller => "locations", :id=>"show", :action => "show")
		end		

    it "should generate from edit /Locations correctly" do
			{:get => "/locations/edit"}.should route_to(:controller => "locations", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /Locations correctly" do
			{:get => "/locations/index"}.should route_to(:controller => "locations", :id=>"index", :action => "show")
		end
		
		it "should generate from update /Locations correctly" do
			{:put => "/locations/update"}.should route_to(:controller => "locations", :id=>"update", :action => "update")
		end
		
		it "should generate from search /Locations correctly" do
			{:put => "/locations/search"}.should route_to(:controller => "locations", :action => "search")
		end
		
		it "should routes to the create /Locations correctly" do
			{:post=>"/locations"}.should route_to(:controller => "locations", :action => "create")
		end
		
	end
end
