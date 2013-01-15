class Admin < ActionMailer::Base
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
   
   def tour(email,category_name,user_name,description,name,is_available,price)
       @email = email
      @category_name=category_name
      @user_name = user_name
      @description = description
      @name=name
      @is_available=is_available
      @price=price
      mail(:to =>@email , :subject => "New Ad has been Posted")  
end

   def lesson(email,category_name,user_name,description,name,is_available,price)

      @email = email
      @category_name=category_name
      @user_name = user_name
      @description = description
      @name=name
      @is_available=is_available
      @price=price
      mail(:to =>@email , :subject => "New Ad has been Posted")  
   end
   
    def dinner(email,category_name,user_name,description,name,is_available,price)
      @email = email
      @category_name=category_name
      @user_name = user_name
      @description = description
      @name=name
      @is_available=is_available
      @price=price
      mail(:to =>@email , :subject => "New Ad has been Posted")  
   end
   
    def accomodation(email,category_name,user_name,description,price)
      @email = email
      @category_name=category_name
      @user_name = user_name
      @description = description
      @price=price
      mail(:to =>@email , :subject => "New Ad has been Posted")  
  end
   def lunch(email,category_name,user_name,description,name,is_available,price)
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
