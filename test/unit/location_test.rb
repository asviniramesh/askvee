require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  
 def setup
   @location = locations(:one)  
  end
  
  test "the truth" do
     assert true
   end
   
  test "invalid_attributes" do
     location=Location.new
     assert location.invalid?
     assert location.errors[:name].any?
   end
   
  test "should not save without a location name and area code" do
     location= Location.new
     location.name = nil
     assert !location.save, "location name can't be blank"
     assert !location.save, "Area Code name can't be blank"
   end
   
  test "Save the location with name" do
     assert @location.save
   end
   
  test "location name and Area code is too short" do
    location = locations(:two)
    assert location.invalid?
    assert_equal "Please enter Location name (2-20 characters)", location.errors[:name].join('; ')
    assert_equal "Area code must be (2-20 characters)", location.errors[:area_code].join('; ')
  end
  
  test 'should have unique name' do
    location_unique = Location.new(:name => @location.name,:area_code =>123)
    location_unique.valid?
    assert_not_nil location_unique.errors[:name]
    assert_not_nil location_unique.errors[:area_code]
  end
  
  test "should not be valid with an INVALID location NAME" do
    @location_invalid_name = Location.new(:name => "123")
    assert_no_match(/^[a-zA-Z\s]+$/, @location_invalid_name.name, "location name must have some letters!")   
  end 
end
