object false
node :header do
  {:status=>"200"}
end
node :body do
  {:contents=>partial("contents/all", :object=>@content)}
end