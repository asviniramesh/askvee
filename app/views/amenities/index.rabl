object false
node :header do
  {:status=>"200"}
end
node :body do
  {:amenity=>partial("amenities/all", :object=>@amenities)}
end