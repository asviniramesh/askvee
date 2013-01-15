object false

node :header do
  {:status=>200}
end

node :body do
  {:users=>{:franchise=>@user_franchise,:host=>@user_host,:guest=>@user_guest,:category=>@categories}}
end
