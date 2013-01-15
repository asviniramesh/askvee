object false

attributes :id, :content, :receiver_id, :category

child :receiver=>:receiver do
  attributes :first_name, :last_name
end