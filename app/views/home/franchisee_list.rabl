object false
node :header do
  {:status=>"200"}
end
node :body do
  {:amenity=>partial("home/user", :object=>@user)}
end