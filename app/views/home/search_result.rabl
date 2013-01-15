object false
node :header do
  {:status=>"200"}
end
node :body do
  {:search_result=>partial("home/all", :object=>@search_result)}
end

node :image do
  { :attachments=>@attachments}
end