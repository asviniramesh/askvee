object false
node :header do
  {:status=>"200"}
end
node :body do
  {:location=>partial("locations/all", :object=>@location_list)}
end