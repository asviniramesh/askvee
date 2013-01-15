require 'spec_helper'

describe ContentsController do
	describe "route recognition for contents" do
		
		it "should create a  new contents correctly" do
			{:get => "/contents/new"}.should route_to(:controller => "contents", :action => "new")
		end

    it "should generate from show /contents correctly" do
			{:get => "/contents/show"}.should route_to(:controller => "contents", :id=>"show", :action => "show")
		end		

    it "should generate from edit /contents correctly" do
			{:get => "/contents/edit"}.should route_to(:controller => "contents", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /contents correctly" do
			{:get => "/contents/index"}.should route_to(:controller => "contents", :id=>"index", :action => "show")
		end
		
		it "should generate from update /contents correctly" do
			{:put => "/contents/update"}.should route_to(:controller => "contents", :id=>"update", :action => "update")
		end
		
		it "should generate from search /contents correctly" do
			{:put => "/contents/search"}.should route_to(:controller => "contents", :action => "search")
		end
		
		it "should routes to the create /Contents correctly" do
			{:post=>"/contents"}.should route_to(:controller => "contents", :action => "create")
		end
		
	end
end