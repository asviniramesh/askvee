require 'spec_helper'

describe HomeController do
	describe "route recognition for Home" do
		
		it "should cancel a  Registration correctly" do
			{:get => "/registration_cancellation"}.should route_to(:controller => "home", :action => "registration_cancellation")
		end
		
			it "should invite franchisee correctly" do
			{:get => "/invite_franchisee"}.should route_to(:controller => "home", :action => "invite_franchisee")
		end
		
		it "should invite host correctly" do
			{:get => "/invite_host"}.should route_to(:controller => "home", :action => "invite_host")
		end
		
		it "should franchisee list correctly" do
			{:get => "/franchisee_list"}.should route_to(:controller => "home", :action => "franchisee_list")
		end
		
		it "should host list correctly" do
			{:get => "/host_list"}.should route_to(:controller => "home", :action => "host_list")
		end
					
			it "should post  advertisement list correctly" do
			{:get => "/post_advertisement_list"}.should route_to(:controller => "home", :action => "post_advertisement_list")
		end
	end
end
