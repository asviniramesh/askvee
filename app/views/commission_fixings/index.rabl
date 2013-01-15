object false
node :header do
  {:status=>"200"}
end
node :body do
  {:commission_fixings=>partial("commission_fixings/all", :object=>@commission_fixings)}
end