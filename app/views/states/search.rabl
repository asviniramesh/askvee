object false
node :header do
  {:status=>"200"}
end
node :body do
  {:states=>partial("states/all", :object=>@state)}
end