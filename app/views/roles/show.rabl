object false
node :header do
  {:status=>"200"}
end
node :body do
  {:roles=>partial("roles/all", :object=>@role)}
end