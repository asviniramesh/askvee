object false
node :header do
  {:status=>"200"}
end
node :body do
  {:cities=>partial("cities/all", :object=>@cities)}
end