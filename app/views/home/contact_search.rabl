object false
node :header do
  {:status=>"200"}
end
node :body do
  {:host=>partial("home/host", :object=>@host),:guest=>partial("home/guest", :object=>@guest)}
end