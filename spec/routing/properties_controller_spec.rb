require 'spec_helper'

describe PropertiesController do
	describe "route recognition for Roles" do
		
		it "should create a  new properties correctly" do
			{:get => "/properties/new"}.should route_to(:controller => "properties", :action => "new")
		end

    it "should generate from show /properties correctly" do
			{:get => "/properties/show"}.should route_to(:controller => "properties", :id=>"show", :action => "show")
		end		

    it "should generate from edit /properties correctly" do
			{:get => "/properties/edit"}.should route_to(:controller => "properties", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /properties correctly" do
			{:get => "/properties/index"}.should route_to(:controller => "properties", :id=>"index", :action => "show")
		end
		
		it "should generate from update /properties correctly" do
			{:put => "/properties/update"}.should route_to(:controller => "properties", :id=>"update", :action => "update")
		end
		
		it "should routes to the create /properties correctly" do
			{:post=>"/properties"}.should route_to(:controller => "properties", :action => "create")
		end
		
	end
end
