object false
node :header do
  {:status=>"200"}
end
node :body do
  {:tour_guide=>partial("tour_guides/tours", :object=>@tour_guide)}
end


node :image do
  { :attachments=>@attachments}
end