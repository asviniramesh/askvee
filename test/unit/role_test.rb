require 'test_helper'

class RoleTest < ActiveSupport::TestCase

  def setup
   @role = roles(:one)  
  end
  
  test "the truth" do
     assert true
   end
   
  test "invalid_attributes" do
     role=Role.new
     assert role.invalid?
     assert role.errors[:name].any?
   end
   
  test "should not save without a role name" do
     role= Role.new
     role.name = nil
     assert !role.save, "role name can't be blank"
   end
   
  test "Save the role with name" do
     assert @role.save
   end
   
  test "role name is too short" do
    role = roles(:two)
    assert role.invalid?
    assert_equal "Please enter Role name (2-20 characters)", role.errors[:name].join('; ')
  end
  
  test 'should have unique name' do
    role_unique = Role.new(:name => @role.name)
    role_unique.valid?
    assert_not_nil role_unique.errors[:name]
  end
  
  test "should not be valid with an INVALID role NAME" do
    @role_invalid_name = Role.new(:name => "123")
    assert_no_match(/^[a-zA-Z\s]+$/, @role_invalid_name.name, "role name must have some letters!")   
  end  
end
