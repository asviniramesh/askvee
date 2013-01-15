require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  def setup
   @room = rooms(:one)
  end
  
  test "the truth" do
     assert true
   end
   
    
  test "invalid_attributes" do
     room=Room.new
     assert room.invalid?
     assert room.errors[:name].any?
     assert room.errors[:address].any?
     assert room.errors[:room_type].any?
     assert room.errors[:description].any?
   end
   
   
    test "should not save without a  name ,address,room_type and description" do
     room= Room.new
     room.name = nil
     room.address = nil
     room.room_type = nil
     room.description = nil
     assert !room.save, "Name name can't be blank"
     assert !room.save, "Address name can't be blank"
     assert !room.save, "Room_type name can't be blank"
     assert !room.save, "Description name can't be blank"
   end
   
  test "should not be valid with an INVALID  NAME" do
    @room_invalid_name = Amenity.new(:name => "123")
    assert_no_match(/^[a-zA-Z\s]+$/, @room_invalid_name.name, "Name must have some letters!")   
  end  
end    