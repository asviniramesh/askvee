require 'spec_helper'

describe User do
	 it { should have_many(:profiles)}
	 it { should have_many(:room_bookings).class_name('RoomBooking') }
	 it { should have_many(:post_ads).class_name('Room')}	
	 it { should have_many(:user_roles)}	
	 it { should have_many(:roles).through(:user_roles) }
	 it { should have_many(:inbox).class_name('Message')}
	 it { should have_many(:outbox).class_name('Message')}
    it { should belong_to(:country) }
    it { should belong_to(:state) }
    it { should belong_to(:city) }
    it { should belong_to(:location) }
 end