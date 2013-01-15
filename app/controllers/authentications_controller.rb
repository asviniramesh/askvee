class AuthenticationsController < ApplicationController
  
  #This method user to access the facebook, twitter and linkedin
def create
#To access the facebook
   if params["request"]["provider"]=="facebook"
     user=User.where(:user_name=>params["request"]["info"]["name"]).first
      if user.present?
        user.update_attributes(:provider=>params["request"]["provider"],:uid=>params["request"]["uid"].to_i,:authentication_token=>	SecureRandom.hex(10), :step=>"7")
        p user.errors
        render :json=>success1(:user=>user)         
      else
        @user=User.new(:email=>params["request"]["info"]["email"],:user_name=>params["request"]["info"]["name"], :first_name=>params["request"]["info"]["first_name"],:last_name=>params["request"]["info"]["last_name"],:provider=>params["request"]["provider"],:uid=>params["request"]["uid"],:authentication_token=>SecureRandom.hex(10), :step=>"7")
        @user.skip_confirmation!
        @user.save(:validate=>false)
        role = Role.find_by_name("Guest")
      @user.roles << role
        render :json=>success1(:user=>@user)
       end
#To access the twitter
    elsif params["request"]["provider"]=="twitter"
     user=User.where(:user_name=>params["request"]["info"]["nickname"]).first
      if user.present?
        user.update_attributes(:provider=>params["request"]["provider"],:uid=>params["request"]["uid"].to_i,:authentication_token=>	SecureRandom.hex(10), :step=>"8")
          p user.errors
        render :json=>success1(:user=>user)         
      else
        @user=User.new(:user_name=>params["request"]["info"]["nickname"],:first_name=>params["request"]["extra"]["raw_info"]["first_name"],:last_name=>params["request"]["extra"]["raw_info"]["last_name"],:provider=>params["request"]["provider"],:uid=>params["request"]["uid"],:authentication_token=>SecureRandom.hex(10), :step=>"8")
        @user.skip_confirmation!
        @user.save(:validate=>false)
        role = Role.find_by_name("Guest")
      @user.roles << role
        render :json=>success1(:user=>@user)
       end
#To access the linkedin
    elsif params["request"]["provider"]=="linkedin"
     user=User.where(:user_name=>params["request"]["info"]["name"]).first
      if user.present?
        user.update_attributes(:provider=>params["request"]["provider"],:uid=>params["request"]["uid"].to_i,:authentication_token=>	SecureRandom.hex(10), :step=>"8")
          p user.errors
        render :json=>success1(:user=>user)         
      else
        @user=User.new(:user_name=>params["request"]["info"]["name"], :first_name=>params["request"]["info"]["first_name"],:last_name=>params["request"]["info"]["last_name"],:provider=>params["request"]["provider"],:uid=>params["request"]["uid"],:authentication_token=>SecureRandom.hex(10), :step=>"8")
        @user.skip_confirmation!
        @user.save(:validate=>false)
        role = Role.find_by_name("Guest")
      @user.roles << role
        render :json=>success1(:user=>@user)
       end  
      end  
  end
  
end
