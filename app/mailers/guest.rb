class Guest < ActionMailer::Base
    
  def contact_host (receiver, sender, message)
    @receiver=receiver
    @message=message
    mail(:from=>sender, :to=>receiver, :subject=>"Message")
  end
end
