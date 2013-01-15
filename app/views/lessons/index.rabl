object false
node :header do
  {:status=>200}
end
node :body do
  {:lessons=>partial("lessons/all", :object=>@lessons)}
end


