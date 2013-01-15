class Mails < ActionMailer::Base
  default from: "admin@askvee.com"
  
  def send_mail sender, receiver, message
    @receiver=receiver
    @message=message
    mail(:from=>sender.email, :to=>receiver.email, :subject=>"Message")
  end
end
