require 'spec_helper'

describe PaymentsController do
	describe "route recognition for Roles" do
		
		it "should create a  new payments correctly" do
			{:get => "/payments/new"}.should route_to(:controller => "payments", :action => "new")
		end

    it "should generate from show /payments correctly" do
			{:get => "/payments/show"}.should route_to(:controller => "payments", :id=>"show", :action => "show")
		end		

    it "should generate from edit /payments correctly" do
			{:get => "/payments/edit"}.should route_to(:controller => "payments", :id=>"edit", :action => "show")
		end	
		
		it "should generate from index /payments correctly" do
			{:get => "/payments/index"}.should route_to(:controller => "payments", :id=>"index", :action => "show")
		end
		
		it "should generate from update /payments correctly" do
			{:put => "/payments/update"}.should route_to(:controller => "payments", :id=>"update", :action => "update")
		end
		
		it "should routes to the create /payments correctly" do
			{:post=>"/payments"}.should route_to(:controller => "payments", :action => "create")
		end
		
	end
end
