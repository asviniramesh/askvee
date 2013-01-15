object @my_accounts

  attributes  :first_name, :last_name, :user_name, :home_phone, :mobile_phone,:address,:addressline2,:email,:state_name,:city_name, :country_id
  node do |u|
    {:country=>u.country ? u.country : nil, :state=>u.state ? u.state : nil, :city=>u.city ? u.city : nil,  :location=>u.location ? u.location : nil, :area_code=>u.area_code ? u.area_code : nil, :country_id=> u.country_id ? u.country_id : nil}
  end
  

