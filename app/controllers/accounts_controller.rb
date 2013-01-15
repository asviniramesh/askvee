class AccountsController < ApplicationController
	skip_before_filter :authorized_user
	before_filter :authorized_user,:except=>['update_sign_up2','find_name']
	respond_to :json, :xml
	
	#This show method displays the current user's role
	def show
    @my_accounts = @current_user
		@role=@my_accounts.roles
	end
	
	#To find and show the user
	def show_users
		@my_accounts=User.find_by_id( params['body'])
		@role=@my_accounts.roles
	end
	
	#This update method is used to update the user's account details like firstname, lastname, email id, password, contact details etc.
	def update
		p "RRRRRRRRRRRRRRRRRR"
		@my_account = @current_user
    @my_account.update_attributes(:address=>params[:user][:address],:addressline2=>params[:user][:addressline2],:city_name=>params[:user][:city_name],:country_id=>params[:user][:country_id],:state_name=>params[:user][:state_name],:location_id=>params[:user][:location_id],:home_phone=>params[:user][:home_phone],:mobile_phone=>params[:user][:mobile_phone],:area_code=>params[:user][:area_code],:step=>"1")
		unless @my_account.errors.empty?
		  render :json=>failure1(@my_account.errors)
		else
      render :json=>{"response"=>"success"}
		end
	end
	
	#This method to update the current user profiles details
	def update_users
		p "TTTTTTTTTTTTTTTTT"
		@my_account=User.find_by_id(params[:user][:id])
		@my_account.update_attributes(:first_name=>params[:user][:first_name],:last_name=>params[:user][:last_name],:address=>params[:user][:address],:addressline2=>params[:user][:addressline2],:city_name=>params[:user][:city_name],:country_id=>params[:user][:country_id],:state_name=>params[:user][:state_name],:location_id=>params[:user][:location_id],:home_phone=>params[:user][:home_phone],:mobile_phone=>params[:user][:mobile_phone],:area_code=>params[:user][:area_code],:step=>"1")
		unless @my_account.errors.empty?
		  render :json=>failure1(@my_account.errors)
		else
      render :json=>{"response"=>"successfull"}
		end
	end
	
	#This confirmation method saves user's accont details
	def confirm
	  @profiles=@current_user.user_profile.update_attributes(params[:body])
	end
	
	#UpdatePassword method updates the user's current password
	def update_password
		parameters=params[:body]
    @user = @current_user
		@user.validate_password(parameters)
		if @user.errors.empty?
      if @user.update_password(parameters)
         render :json=>{:response=>"success"}
      else
        render :json=>failure1(@user.errors)
      end
    else
      render :json=>failure1(@user.errors)
    end
  end
	
#To update the profile datails when user logged in
	def update_sign_up2
		@my_account=User.find_by_authentication_token(params[:user][:access_token])
		@my_account.update_attributes(:params[:user],:step=>'1')
		 if @my_account.errors.empty?
			 render :json=>{:response=>"success"}
		else
			render :json=>failure1(@my_account.errors)
		end
	end
	
	#To reset the current user password
	def find_name
	  @user=User.find_by_reset_password_token(params[:id])
		render :json=>@user
	end
	
end