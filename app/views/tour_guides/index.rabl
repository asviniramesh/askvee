object false
node :header do
  {:status=>200}
end
node :body do
  {:tour_guides=>partial("tour_guides/all", :object=>@tour_guides)}
end


