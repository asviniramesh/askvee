object false
node :header do
  {:status=>"200"}
end
node :body do
  {:categories=>partial("categories/all", :object=>@categories)}
end