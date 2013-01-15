object @country
attributes :id, :name


child :states => :state do
  attributes :id, :name, :country_id
end

child @city => :city do
  attributes :id, :name, :state_id
end

child @location => :location do
  attributes :id, :name, :city_id, :area_code
end