object false
node :header do
  {:status=>200}
end
node :body do
  {:report=>partial("reports/accessbooking", :object=>@access_booking)}
end