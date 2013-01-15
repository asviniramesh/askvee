object false
node :header do
  {:status=>200}
end
node :body do
   {:user=>partial("home/list", :object=>@user)}
end