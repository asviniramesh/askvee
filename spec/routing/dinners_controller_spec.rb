require 'spec_helper'

describe DinnersController do
	describe "route recognition for Roles" do
		
		it "should create a  new Dinner correctly" do
			{:get => "/dinners/new"}.should route_to(:controller => "dinners", :action => "new")
		end

    it "should generate from show /dinners correctly" do
			{:get => "/dinners/show"}.should route_to(:controller => "dinners", :id=>"show", :action => "show")
		end		

    it "should generate from edit /dinners correctly" do
			{:get => "/dinners/edit"}.should route_to(:controller => "dinners", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /dinners correctly" do
			{:get => "/dinners/index"}.should route_to(:controller => "dinners", :id=>"index", :action => "show")
		end
		
		it "should generate from update /dinners correctly" do
			{:put => "/dinners/update"}.should route_to(:controller => "dinners", :id=>"update", :action => "update")
		end
		
		it "should routes to the create /dinners correctly" do
			{:post=>"/dinners"}.should route_to(:controller => "dinners", :action => "create")
		end
		
	end
end

