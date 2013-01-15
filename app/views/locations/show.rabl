object false
node :header do
  {:status=>"200"}
end
node :body do
  {:location=>partial("locations/all",:object=>@location),:city=>partial("cities/all", :object=>@city),:state=>partial("states/all",:object=>@state),:country=>partial("countries/all",:object=>@country)}
end