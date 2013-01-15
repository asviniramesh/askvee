require 'test_helper'

class AmenityTest < ActiveSupport::TestCase
  
  def setup
   @amenity = amenities(:one)  
  end
  
  test "the truth" do
     assert true
   end
   
  test "invalid_attributes" do
     amenity=Amenity.new
     assert amenity.invalid?
     assert amenity.errors[:name].any?
   end
   
  test "should not save without a Amenity name" do
     amenity= Amenity.new
     amenity.name = nil
     assert !amenity.save, "Amenity name can't be blank"
   end
   
  test "Save the Amenity with name" do
     assert @amenity.save
   end
   
  test "Amenity name is too short" do
    amenity = amenities(:two)
    assert amenity.invalid?
    assert_equal "Please enter Amenity name (2-30 characters)", amenity.errors[:name].join('; ')
  end
  
  test 'should have unique name' do
    amenity_unique = Amenity.new(:name => @amenity.name)
    amenity_unique.valid?
    assert_not_nil amenity_unique.errors[:name]
  end
  
  test "should not be valid with an INVALID AMENITY NAME" do
    @amenity_invalid_name = Amenity.new(:name => "123")
    assert_no_match(/^[a-zA-Z\s]+$/, @amenity_invalid_name.name, "Amenity name must have some letters!")   
  end  
end
