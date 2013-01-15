object false
node :header do
  {:status=>"200"}
end
node :body do
  {:user=>partial("shared/profile",:object=>@my_accounts),:lesson=>partial("lessons/all", :object=>@lesson)}
end

node :image do
  { :attachments=>@attachments}
end
