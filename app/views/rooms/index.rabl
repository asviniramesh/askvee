object false
node :header do
  {:status=>200}
end
node :body do
  {:rooms=>partial("rooms/all", :object=>@rooms)}
end


