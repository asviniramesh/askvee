require 'spec_helper'

describe AccountsController do
	describe "route recognition for Users" do
		
		it "should generate from Update Password /Accounts correctly" do
			{:put => "/accounts/update"}.should route_to(:controller => "accounts", :id=>"update", :action => "update")
		end
		
		it "should generate from edit /Accounts correctly" do
			{:get => "/accounts/edit"}.should route_to(:controller => "accounts", :id=>"edit", :action => "show")
		end
		
		it "should generate from show /Accounts correctly" do
			{:get => "/accounts/show"}.should route_to(:controller => "accounts", :id => "show", :action => "show")
		end
	end
end
