class MessagesController < ApplicationController
	before_filter :authorized_user
	
	def users_list
		#@users=User.select("email").where("email !=?",@current_user.email)
		@users_all=User.where("email !=? AND is_rejected = ?",@current_user.email,false).all
		@categories=Category.all
		p @categories
		p "!!!!!!!!!!!!!!!!!!!!!!!!!!"
		@users = []
		@user_franchise = []
		@user_host = []
		@user_guest = []
		@users_all.each do |user|
			if user.roles[0].id == 2
		 @user_franchise << user.email
			elsif user.roles[0].id == 3
	   @user_host << user.email
		 elsif user.roles[0].id == 4
			 @user_guest << user.email
		end
	end
	end
	
	def create
		puts params
		@receiver=User.find_by_email(params[:body][:email]) if params[:body][:email]
		@message=Message.new(:content=>params[:body][:content], :sender_id=>@current_user.id, :receiver_id=>@receiver ? (@receiver.id) : (""), :email=>params[:body][:email],:category=>Category.find_by_id(params[:body][:category]).id)
		p @message
		p ")))))))))))))))))))))"
		
		if @message.save
			Mails.send_mail(@current_user, @receiver, @message.content,@message.category).deliver
			render :json=>success1
		else
			render :json=>failure1(@message.errors)
		end
	end
	
	def inbox
		@inbox=@current_user.inbox.order("created_at DESC")
		#render :json=>{:response=>"success"}
	end
	
	def outbox
		@outbox=@current_user.outbox.order("created_at DESC")
	end
end
