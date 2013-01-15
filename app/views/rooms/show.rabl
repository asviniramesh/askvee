object false
node :header do
  {:status=>"200"}
end
node :body do
  {:room=>partial("rooms/room", :object=>@room), :green_profile=>@green_profile_name, :amenity=>@amenity_name, :attachment=>@attachments}
end

child @property do
 attributes :property_type, :id
end