object false
node :header do
  {:status=>"200"}
end
node :body do
  {:report=>partial("reports/room_franchisee", :object=>@rooms)}
end