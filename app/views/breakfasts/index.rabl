object false
node :header do
  {:status=>"200"}
end
node :body do
  { :breakfasts=>partial("breakfasts/all",:object=>@breakfasts)}
end