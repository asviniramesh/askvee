require 'spec_helper'

describe RolesController do
	describe "route recognition for Roles" do
		
		it "should create a  new Roles correctly" do
			{:get => "/roles/new"}.should route_to(:controller => "roles", :action => "new")
		end

    it "should generate from show /Roles correctly" do
			{:get => "/roles/show"}.should route_to(:controller => "roles", :id=>"show", :action => "show")
		end		

    it "should generate from edit /Roles correctly" do
			{:get => "/roles/edit"}.should route_to(:controller => "roles", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /Roles correctly" do
			{:get => "/roles/index"}.should route_to(:controller => "roles", :id=>"index", :action => "show")
		end
		
		it "should generate from update /Roles correctly" do
			{:put => "/roles/update"}.should route_to(:controller => "roles", :id=>"update", :action => "update")
		end
		
		it "should routes to the create /Roles correctly" do
			{:post=>"/roles"}.should route_to(:controller => "roles", :action => "create")
		end
		
	end
end
