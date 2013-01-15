class FeedbackHost < ActionMailer::Base
  default from: "from@example.com"
  def feedback_host(email)
    @email = email
 
    mail(:to =>["janani@railsfactory.org","parthiban@railsfactory.org"], :subject => "Feedback")  
    
  end
  
end
