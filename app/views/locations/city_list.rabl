object false
node :header do
  {:status=>"200"}
end
node :body do
  {:city=>partial("locations/all", :object=>@city_list)}
end