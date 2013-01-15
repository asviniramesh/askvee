require 'test_helper'

class CountryTest < ActiveSupport::TestCase
 
 def setup
   @country = countries(:one)  
  end
  
  test "the truth" do
     assert true
   end
   
  test "invalid_attributes" do
     country=Country.new
     assert country.invalid?
     assert country.errors[:name].any?
   end
   
  test "should not save without a Country name" do
     country= Country.new
     country.name = nil
     assert !country.save, "Country name can't be blank"
   end
   
  test "Save the Country with name" do
     assert @country.save
   end
   
  test "Country name is too short" do
    country = countries(:two)
    assert country.invalid?
    assert_equal "Please enter Country name (2-20 characters)", country.errors[:name].join('; ')
  end
  
  test 'should have unique name' do
    country_unique = Country.new(:name => @country.name)
    country_unique.valid?
    assert_not_nil country_unique.errors[:name]
  end
  
  test "should not be valid with an INVALID COUNTRY NAME" do
    @country_invalid_name = Country.new(:name => "123")
    assert_no_match(/^[a-zA-Z\s]+$/, @country_invalid_name.name, "Country name must have some letters!")   
  end 
end
