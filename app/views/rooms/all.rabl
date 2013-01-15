object false
 attributes :id, :host_id, :name, :description,:price, :is_available, :accommodates, :currency,:length
glue :property do
  attributes :property_type
end