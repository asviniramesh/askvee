object false
node :header do
  {:status=>"200"}
end
node :body do
  {:locations=>partial("locations/all", :object=>@location)}
end