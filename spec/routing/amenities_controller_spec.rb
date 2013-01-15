require 'spec_helper'

describe AmenitiesController do
	describe "route recognition for Amenities" do
		
		it "should create a  new Amenities correctly" do
			{:get => "/amenities/new"}.should route_to(:controller => "amenities", :action => "new")
		end

    it "should generate from show /Amenities correctly" do
			{:get => "/amenities/show"}.should route_to(:controller => "amenities", :id=>"show", :action => "show")
		end		

    it "should generate from edit /Amenities correctly" do
			{:get => "/amenities/edit"}.should route_to(:controller => "amenities", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /amenities correctly" do
			{:get => "/amenities/index"}.should route_to(:controller => "amenities", :id=>"index", :action => "show")
		end
		
		it "should generate from update /amenities correctly" do
			{:put => "/amenities/update"}.should route_to(:controller => "amenities", :id=>"update", :action => "update")
		end
		
		it "should generate from search /amenities correctly" do
			{:put => "/amenities/search"}.should route_to(:controller => "amenities", :action => "search")
		end
		
		it "should routes to the create /Amenities correctly" do
			{:post=>"/amenities"}.should route_to(:controller => "amenities", :action => "create")
		end
		
	end
end
