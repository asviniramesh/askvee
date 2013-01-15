require "spec_helper"
include Devise::TestHelpers

describe GuestsController do

  it "should get before_filtered for authorized_user!" do
      controller.stub!(:authorized_user).and_return(true)
    end

 it "should use CountriesController" do
    controller.should be_an_instance_of(GuestsController)
   end


  

 end
