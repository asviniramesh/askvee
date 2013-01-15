require 'test_helper'

class StateTest < ActiveSupport::TestCase
   def setup
   @state = states(:one)  
  end
  
  test "the truth" do
     assert true
   end
   
  test "invalid_attributes" do
     state=State.new
     assert state.invalid?
     assert state.errors[:name].any?
   end
   
  test "should not save without a state name" do
     state= State.new
     state.name = nil
     assert !state.save, "state name can't be blank"
   end
   
  test "Save the state with name" do
     assert @state.save
   end
   
  test "state name is too short" do
    state = states(:two)
    assert state.invalid?
    assert_equal "Please enter State name (2-20 characters)", state.errors[:name].join('; ')
  end
  
  test 'should have unique name' do
    state_unique = State.new(:name => @state.name)
    state_unique.valid?
    assert_not_nil state_unique.errors[:name]
  end
  
  test "should not be valid with an INVALID state NAME" do
    @state_invalid_name = State.new(:name => "123")
    assert_no_match(/^[a-zA-Z\s]+$/, @state_invalid_name.name, "state name must have some letters!")   
  end  
end
