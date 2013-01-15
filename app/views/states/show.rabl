object false
node :header do
  {:status=>"200"}
end
node :body do
  {:state=>partial("states/all", :object=>@state),:country=>partial("countries/all",:object=>@country)}
end