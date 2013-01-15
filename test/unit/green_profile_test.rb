require 'test_helper'

class GreenProfileTest < ActiveSupport::TestCase
 
 def setup
   @green_profile = green_profiles(:one)  
  end
  
  test "the truth" do
     assert true
   end
   
  test "invalid_attributes" do
     green_profile=GreenProfile.new
     assert green_profile.invalid?
     assert green_profile.errors[:name].any?
   end
   
  test "should not save without a green_profile name" do
     green_profile= GreenProfile.new
     green_profile.name = nil
     assert !green_profile.save, "green_profile name can't be blank"
   end
   
  test "Save the green_profile with name" do
     assert @green_profile.save
   end
   
  test "green_profile name is too short" do
    green_profile = green_profiles(:two)
    assert green_profile.invalid?
    assert_equal "Please enter GreenProfile name (2-50 characters)", green_profile.errors[:name].join('; ')
  end
  
  test 'should have unique name' do
    green_profile_unique = GreenProfile.new(:name => @green_profile.name)
    green_profile_unique.valid?
    assert_not_nil green_profile_unique.errors[:name]
  end
  
  test "should not be valid with an INVALID green_profile NAME" do
    @green_profile_invalid_name = GreenProfile.new(:name => "123")
    assert_no_match(/^[a-zA-Z\s]+$/, @green_profile_invalid_name.name, "green_profile name must have some letters!")   
  end  
end
