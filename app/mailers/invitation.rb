class Invitation < ActionMailer::Base
  default from: "arun.s@railsfactory.org"
  def invite(email,subject,permalink)
    @email = email
    @subject = subject
    @permalink= permalink
    mail(:to =>email , :subject => subject)  
  end
  
end
