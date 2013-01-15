require 'spec_helper'

describe RoomsController do
	describe "route recognition for Rooms" do
		
		it "should create a  new Rooms correctly" do
			{:get => "/rooms/new"}.should route_to(:controller => "rooms", :action => "new")
		end

    it "should generate from show /Rooms correctly" do
			{:get => "/rooms/show"}.should route_to(:controller => "rooms", :id=>"show", :action => "show")
		end		

    it "should generate from edit /Rooms correctly" do
			{:get => "/rooms/edit"}.should route_to(:controller => "rooms", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /Rooms correctly" do
			{:get => "/rooms/index"}.should route_to(:controller => "rooms", :id=>"index", :action => "show")
		end
		
		it "should generate from update /Rooms correctly" do
			{:put => "/rooms/update"}.should route_to(:controller => "rooms", :id=>"update", :action => "update")
		end
	
		it "should routes to the create /Rooms correctly" do
			{:post=>"/rooms"}.should route_to(:controller => "rooms", :action => "create")
		end
		
	end
end
