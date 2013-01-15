object false
node :header do
  {:status=>"200"}
end
node :body do
  {:payments=>partial("payments/all", :object=>@payments)}
end