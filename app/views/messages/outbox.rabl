object false

node :header do
  {:status=>200}
end

node :body do
  {:mails=>partial("/messages/outbox_receiver", :object=>@outbox)}
end