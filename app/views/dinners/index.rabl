object false
node :header do
  {:status=>200}
end
node :body do
  {:dinners=>partial("dinners/all", :object=>@dinners)}
end


