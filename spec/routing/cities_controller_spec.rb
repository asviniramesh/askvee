require 'spec_helper'

describe  CitiesController do
	describe "route recognition for Cities" do
		
		it "should create a  new cities correctly" do
			{:get => "/cities/new"}.should route_to(:controller => "cities", :action => "new")
		end

    it "should generate from show /cities correctly" do
			{:get => "/cities/show"}.should route_to(:controller => "cities", :id=>"show", :action => "show")
		end		

    it "should generate from edit /cities correctly" do
			{:get => "/cities/edit"}.should route_to(:controller => "cities", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /cities correctly" do
			{:get => "/cities/index"}.should route_to(:controller => "cities", :id=>"index", :action => "show")
		end
		
		it "should generate from update /cities correctly" do
			{:put => "/cities/update"}.should route_to(:controller => "cities", :id=>"update", :action => "update")
		end
		
		it "should generate from search /cities correctly" do
			{:put => "/cities/search"}.should route_to(:controller => "cities", :action => "search")
		end
		
		it "should generate from state_list /cities correctly" do
			{:get => "/cities/state_list"}.should route_to(:controller => "cities",:action => "state_list")
		end
		
		it "should routes to the create /cities correctly" do
			{:post=>"/cities"}.should route_to(:controller => "cities", :action => "create")
		end
		
	end
end