object false
node :header do
  {:status=>"200"}
end
node :body do
  {:dinner=>partial("dinners/dinner", :object=>@dinner)}
end

node :image do
  { :attachments=>@attachments}
end