object false
node :header do
  {:status=>"200"}
end
node :body do
  {:green_profiles=>partial("green_profiles/all", :object=>@green_profiles)}
end