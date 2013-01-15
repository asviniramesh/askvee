object false
node :header do
  {:status=>"200"}
end
node :body do
  {:country=>partial("countries/all", :object=>@country)}
end