class InviteFranchisee < ActionMailer::Base
  default from: "from@example.com"

  def invite_franchisee(email,user_name,password,area_code)
    @email = email
    @user_name = user_name
    @password = password
    @area_code=area_code
    mail(:to =>email , :subject => "Invitation from Askvee")  
  end
  
end
