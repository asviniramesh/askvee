require 'spec_helper'

describe StatesController do
	describe "route recognition for States" do
		
		it "should create a  new States correctly" do
			{:get => "/states/new"}.should route_to(:controller => "states", :action => "new")
		end

    it "should generate from show /States correctly" do
			{:get => "/states/show"}.should route_to(:controller => "states", :id=>"show", :action => "show")
		end		

    it "should generate from edit /States correctly" do
			{:get => "/states/edit"}.should route_to(:controller => "states", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /States correctly" do
			{:get => "/states/index"}.should route_to(:controller => "states", :id=>"index", :action => "show")
		end
		
		it "should generate from update /States correctly" do
			{:put => "/states/update"}.should route_to(:controller => "states", :id=>"update", :action => "update")
		end
		
		it "should generate from search /States correctly" do
			{:put => "/states/search"}.should route_to(:controller => "states", :action => "search")
		end
		
		it "should routes to the create /States correctly" do
			{:post=>"/states"}.should route_to(:controller => "states", :action => "create")
		end
		
	end
end
