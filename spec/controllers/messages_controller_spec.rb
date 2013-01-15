require 'spec_helper'

describe MessagesController do
	
		describe "messages Controller for the askvee" do
			
			it "should get before_filtered for authorized_user" do
			controller.stub!(:authorized_user).and_return(true)
		end
		
			it "should list the user" do
				@user=User.stub(:select).with("jana@gmail.com").and_return(true)
				@user.stub(:where).with("email !=?","askvee@gmail.com")
			end
			
			it "Should compose the message" do
				@receiver=User.stub(:find_by_email).with("railsfactory@rails.com")
				@message=Message.stub(:create).with(:content=>"hai", :sender_id=>1, :receiver_id=>2)
			end
		
		end
	end
	