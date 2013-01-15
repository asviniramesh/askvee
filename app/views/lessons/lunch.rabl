object @lesson
 attributes  :id, :host_id, :description, :name, :is_available, :price, :is_available, :is_approved, :approver_id, :created_at, :updated_at
 node do |r|
   {:images=>r.attachments ? "http://localhost:3000"+r.attachments.first.image.to_s : nil}
 end