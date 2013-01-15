# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(:name=>"Admin")
Role.create(:name=>"Franchisee")
Role.create(:name=>"Host")
Role.create(:name=>"Guest")

Country.create([{:name=>"India"},{:name=>"Australia"},{:name=>"Pakistan"},{:name=>"United Kingdom"},{:name=>"Israel"}])


User.destroy_all

 u = User.create(:email=>"admin@askvee.com",:first_name=>"admin",:last_name=>"askvee",:user_name=>"admin",:password=>"admin123",:password_confirmation=>"admin123",:address=>"Askvee",:home_phone=>"9345251789",:mobile_phone=>"9786543210",:country_id=>1,:state_name=>"Tamilnadu",:city_name=>"Chennai",:terms_of_service=>true,:role_id=>1,:area_code=>"001")
role = Role.find 1
u.roles << role
u.confirmed_at=Date.today
u.authentication_token=SecureRandom.hex(10)
u.save(:validate=>false)

Property.create(:property_type=>"Home")
Property.create(:property_type=>"Flats")
Property.create(:property_type=>"Apartments")
Property.create(:property_type=>"spare room")

Amenity.create(:name=>"Ac")
Amenity.create(:name=>"Fridge")
Amenity.create(:name=>"Washing Machine")

Location.create(:area_code=>"chennai",:country_id=>1)
Location.create(:area_code=>"south street",:country_id=>2)
Location.create(:area_code=>"west street",:country_id=>3)
Location.create(:area_code=>"north street",:country_id=>4)

GreenProfile.create(:name=>'Energy-efficient lighting')
GreenProfile.create(:name=>'Recycling bins for plastic/cartons')
GreenProfile.create(:name=>'Food compost')
GreenProfile.create(:name=>'Housekeeping uses non-toxic cleaning agents and laundry detergent')
GreenProfile.create(:name=>'Organic & fair trade food for breakfast')
GreenProfile.create(:name=>'Use renewable Electricity')
GreenProfile.create(:name=>'100% organic cotton sheets, towels and mattresses')
GreenProfile.create(:name=>'Host make bicycle available to guest')


