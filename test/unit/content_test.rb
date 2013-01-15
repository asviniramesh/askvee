require 'test_helper'

class ContentTest < ActiveSupport::TestCase
  
  
  def setup
    @content=contents(:one)
  end
  
   
   test "the truth" do
     assert true
   end
   
  test "invalid_attributes" do
     content=Content.new
     assert content.invalid?
     assert content.errors[:name].any?
     assert content.errors[:description].any?
   end
   
  test "should not save without a Content name and description" do
     content= Content.new
     content.name = nil
     content.description = nil
     assert !content.save, "Content name can't be blank"
     assert !content.save, "Content description can't be blank"
   end
  
  test "Save the Content with name and Description" do
     assert @content.save
   end
   
  test "Content name and description is too short" do
    content = contents(:two)
    assert content.invalid?
    assert_equal "Please enter Content name (2-20 characters)", content.errors[:name].join('; ')
    assert_equal "Content Description can be only alphanumeric; Please enter Content description (2-100 characters)", content.errors[:description].join('; ')
  end
  
  test "should not be valid with an INVALID CONTENT NAME" do
    @content_invalid_name = Content.new(:name => "123")
    assert_no_match(/^[a-zA-Z\s]+$/, @content_invalid_name.name, "Name must have some letters!")   
  end 
 end
