object false
node :header do
  {:status=>"200"}
end
node :body do
  {:property=>partial("properties/all", :object=>@property)}
end