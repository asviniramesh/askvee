object false
node :header do
  {:status=>"200"}
end
node :body do
  {:properties=>partial("properties/all", :object=>@properties)}
end