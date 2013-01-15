object false
node :header do
  {:status=>"200"}
end
node :body do
  {:category=>partial("categories/all", :object=>@category)}
end