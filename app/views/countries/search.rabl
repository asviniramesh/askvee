object false
node :header do
  {:status=>"200"}
end
node :body do
  {:countries=>partial("countries/one", :object=>@country)}
end