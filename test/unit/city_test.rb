require 'test_helper'

class CityTest < ActiveSupport::TestCase
  
  def setup
   @city = cities(:one)  
  end
  
  test "the truth" do
    assert true
  end
  
  test "invalid_attributes" do
    city=City.new
    assert city.invalid?
    assert city.errors[:name].any?
  end

  test "should not save without a city name" do
    city= City.new
    city.name = nil
    assert !city.save, "City name can't be blank"
  end
  
  test "Save the City with name" do
     assert @city.save
   end
   
  test "City name is too short" do
    city = cities(:two)
    assert city.invalid?
    assert_equal "Please enter City name (2-20 characters)", city.errors[:name].join('; ')
  end
  
  test 'should have unique name' do
    city_unique = City.new(:name => @city.name)
    city_unique.valid?
    assert_not_nil city_unique.errors[:name]
  end
  
  test "should not be valid with an INVALID CITY NAME" do
    @city_invalid_name = City.new(:name => "123")
    assert_no_match(/^[a-zA-Z\s]+$/, @city_invalid_name.name, "city name must have some letters!")   
  end 

end
