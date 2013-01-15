object false
node :header do
  {:status=>"200"}
end
node :body do
  {:state=>partial("states/all", :object=>@states)}
end


