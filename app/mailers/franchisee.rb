class Franchisee < ActionMailer::Base
  default from: "askvee@askvee.com"
    def notification(email,category_name,user_name,description,name,is_available,price)
      @email = email
      @category_name=category_name
      @user_name = user_name
      @description = description
      @name=name
      @is_available=is_available
      @price=price
      mail(:to =>@email , :subject => "New Ad has been Posted")  
   end
end
