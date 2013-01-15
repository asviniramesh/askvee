object false
node :header do
  {:status=>"200"}
end
node :body do
  {:city=>partial("cities/all", :object=>@city),:state=>partial("states/all",:object=>@state),:country=>partial("countries/all",:object=>@country)}
end