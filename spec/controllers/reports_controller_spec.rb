require 'spec_helper'

describe ReportsController do
	
		describe "reports Controller for the askvee" do
			
			it "Should get the room availability for askvee" do
				Room.stub(:find_booking_availability).with(1,15/5/2012,17/5/2012,1,1,1,1,"saidai")
			end
			
			it "Should get the room per franchisee for askvee" do
				Room.stub(:find_booking_availability).with(1)
			end
			
			it "Should get the list of room request  for askvee" do
				Room.stub(:is_room).with(15/5/2012,17/5/2012)
			end
			
						
			it "Should get the access booking for askvee" do
				Room.stub(:is_booked).with(15/5/2012,17/5/2012,true)
			end
			
			it "Should get availability of room" do
				Room.stub(:find_is_available_area).with(1,123,15/5/2012,17/5/2012)
			end
		end
	end
	