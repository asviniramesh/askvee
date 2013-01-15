require 'spec_helper'

describe MessagesController do
	describe "route recognition for Messages" do

		it "should routes to the create /Messages correctly" do
			{:post=>"/messages"}.should route_to(:controller => "messages", :action => "create")
		end
		
		it "should routes to the user_list /Messages correctly" do
			{:get=>"/messages/users_list"}.should route_to(:action=>"show", :controller=>"messages", :id=>"users_list")
		end
				
		it "should routes to the Inbox /Messages correctly" do
			{:get=>"/messages/inbox"}.should route_to(:action=>"show", :controller=>"messages", :id => "inbox")
		end
				
		it "should routes to the Outbox /Messages correctly" do
			{:get=>"/messages/outbox"}.should route_to(:action=>"show", :controller=>"messages", :id => "outbox")
		end
	end
end
