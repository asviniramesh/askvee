object false
node :header do
  {:status=>"200"}
end
node :body do
  {:room=>partial("rooms/all", :object=>@room)}
end


node :room do
child @date do
 attributes :id, :check_in, :accomodation_id, :is_accepted, :is_unavailable
end
end