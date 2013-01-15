object false
node :header do
  {:status=>"200"}
end
node :body do
  {:user=>partial("shared/profile",:object=>@my_accounts),:breakfast=>partial("breakfasts/all", :object=>@breakfast)}
end

node :image do
  { :attachments=>@attachments}
end
