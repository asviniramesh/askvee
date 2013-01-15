object false
node :header do
  {:status=>200}
end
node :body do
   {:room=>partial("home/room", :object=>@room)}
end