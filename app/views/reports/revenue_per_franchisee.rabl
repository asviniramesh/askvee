object false
node :header do
  {:status=>"200"}
end
node :body do
  {:revenue=>partial("reports/accessbooking", :object=>@revenue)}
end