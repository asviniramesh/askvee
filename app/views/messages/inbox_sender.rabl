object false

attributes :id, :content, :sender_id,:category

child :sender=>:sender do
  attributes :first_name, :last_name
end