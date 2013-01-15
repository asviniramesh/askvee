require 'spec_helper'

describe SessionsController do
	describe "route recognition for Sessions" do
		
		it "Users login into the Askvee application" do
			{:get => "/sign_in"}.should route_to(:controller => "sessions", :action => "new")
		end
		
		it "Users logout from the Askvee application" do
			{:get => "/logout"}.should route_to(:controller => "devise/sessions", :action => "destroy")
		end
		
		it "Users Sign_up from the Askvee application" do
			{:get => "/sign_up"}.should route_to(:controller => "registrations", :action => "new")
		end
		
	end
end
  