object false
node :header do
  {:status=>"200"}
end
node :body do
  {:amenities=>partial("amenities/all", :object=>@amenity)}
end