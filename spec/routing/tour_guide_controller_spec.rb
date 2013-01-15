require 'spec_helper'

describe TourGuidesController do
	describe "route recognition for Roles" do
		
		it "should create a  new tour_guides correctly" do
			{:get => "/tour_guides/new"}.should route_to(:controller => "tour_guides", :action => "new")
		end

    it "should generate from show /tour_guides correctly" do
			{:get => "/tour_guides/show"}.should route_to(:controller => "tour_guides", :id=>"show", :action => "show")
		end		

    it "should generate from edit /tour_guides correctly" do
			{:get => "/tour_guides/edit"}.should route_to(:controller => "tour_guides", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /tour_guides correctly" do
			{:get => "/tour_guides/index"}.should route_to(:controller => "tour_guides", :id=>"index", :action => "show")
		end
		
		it "should generate from update /tour_guides correctly" do
			{:put => "/tour_guides/update"}.should route_to(:controller => "tour_guides", :id=>"update", :action => "update")
		end
		
		it "should routes to the create /tour_guides correctly" do
			{:post=>"/tour_guides"}.should route_to(:controller => "tour_guides", :action => "create")
		end
		
	end
end
