object false
node :header do
  {:status=>"200"}
end
node :body do
  {:payment=>partial("payments/all", :object=>@payment)}
end