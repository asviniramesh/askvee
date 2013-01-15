require 'spec_helper'

describe CountriesController do
	describe "route recognition for countries" do
		
		it "should create a  new Countries correctly" do
			{:get => "/countries/new"}.should route_to(:controller => "countries", :action => "new")
		end

    it "should generate from show /Countries correctly" do
			{:get => "/countries/show"}.should route_to(:controller => "countries", :id=>"show", :action => "show")
		end		

    it "should generate from edit /Countries correctly" do
			{:get => "/countries/edit"}.should route_to(:controller => "countries", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /Countries correctly" do
			{:get => "/countries/index"}.should route_to(:controller => "countries", :id=>"index", :action => "show")
		end
		
		it "should generate from update /Countries correctly" do
			{:put => "/countries/update"}.should route_to(:controller => "countries", :id=>"update", :action => "update")
		end
		
		it "should generate from search /Countries correctly" do
			{:put => "/countries/search"}.should route_to(:controller => "countries", :action => "search")
		end
		
			it "should routes to the create /Countries correctly" do
			{:post=>"/countries"}.should route_to(:controller => "countries", :action => "create")
		end
		
	end
end