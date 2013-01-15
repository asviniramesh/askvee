require 'spec_helper'

describe CategoriesController do
	describe "route recognition for Roles" do
		
		it "should create a  new Category correctly" do
			{:get => "/categories/new"}.should route_to(:controller => "categories", :action => "new")
		end

    it "should generate from show /categories correctly" do
			{:get => "/categories/show"}.should route_to(:controller => "categories", :id=>"show", :action => "show")
		end		

    it "should generate from edit /categories correctly" do
			{:get => "/categories/edit"}.should route_to(:controller => "categories", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /breakfasts correctly" do
			{:get => "/categories/index"}.should route_to(:controller => "categories", :id=>"index", :action => "show")
		end
		
		it "should generate from update /breakfasts correctly" do
			{:put => "/categories/update"}.should route_to(:controller => "categories", :id=>"update", :action => "update")
		end
		
		it "should routes to the create /Roles correctly" do
			{:post=>"/categories"}.should route_to(:controller => "categories", :action => "create")
		end
		
	end
end
