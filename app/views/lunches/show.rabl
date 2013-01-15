object false
node :header do
  {:status=>"200"}
end
node :body do
  {:user=>partial("shared/profile",:object=>@my_accounts),:lunch=>partial("lunches/all", :object=>@lunch)}
end

node :image do
  { :attachments=>@attachments}
end