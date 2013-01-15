object false
node :header do
  {:status=>"200"}
end
node :body do
  {:search=>partial("home/all", :object=>@search_list)}
end

node :image do
  { :attachments=>@attachments}
end