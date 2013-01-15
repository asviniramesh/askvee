require 'spec_helper'

describe SessionsController do
	let(:user) { stub_model(User) }

  describe "Sign_in" do
    
    it "should get skip before_filtered for authorized_user" do
			 controller.stub!(:authorized_user).and_return(true)
		 end
		 
		it "Should logout the sessions controller"do
			User.stub!(:find_by_authentication_token).with("84c8845d89c2be70035e").and_return(true)
			User.stub!(:find_by_authentication_token).with(:authentication_token=>"")
		end
	end
end
	
