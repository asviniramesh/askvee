FactoryGirl.define do
  factory :user do
		user_name "janani"
		first_name "rails"
		last_name "ruby"
		email "rails@railsfactory.org"
		password "password"
    password_confirmation "password"
		role_id 1
		state_id 1
		country_id 1
		city_id 1
		location_id 1
		area_code "123"
    address "saidapet"
		home_phone "12345678901"
		mobile_phone "67890123567"
	end
end
