object @user
  node do |u|
    {:country=>u.country ? u.country : nil, :state=>u.state ? u.state : nil, :city=>u.city ? u.city : nil,  :location=>u.location ? u.location : nil, :area_code=>u.location ? u.location : nil}
  end