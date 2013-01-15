object false
node :header do
  {:status=>"200"}
end
node :body do
  {:state=>partial("cities/all", :object=>@state_list)}
end