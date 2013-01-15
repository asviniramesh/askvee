object false
node :header do
  {:status=>"200"}
end

node :body do
  {:login=>partial("shared/login", :object=>@my_accounts), :profile=>partial("shared/profile", :object=>@my_accounts),:list_of_bookings=>partial("hosts/all", :object=>@list_of_bookings)}
end

