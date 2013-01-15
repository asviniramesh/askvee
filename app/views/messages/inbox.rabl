object false

node :header do
  {:status=>200}
end
node :body do
  {:mails=>partial("/messages/inbox_sender", :object=>@inbox)}
end