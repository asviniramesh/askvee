object false
node :header do
  {:status=>200}
end
node :body do
  {:lunches=>partial("lunches/all", :object=>@lunches)}
end


