class HomeController < ApplicationController
  before_filter :current_user, :except=>[:search,:search_result]
 
#To cancel the registered user 
	def  registration_cancellation
		user= params[:body][:user_id]
		@user = User.find_by_id(user)
		@user.update_attributes(:is_rejected => "true")
		if @user.save :validate => false
		 render :json=>{:response=>"success"}
		else
		 render :json=>failure1(@user.errors)
	 end
	end
	
	#To reject the duplicate entry
	def reject_duplicate_entry
		@room = Room.find_by_id(params[:id])
		if @room.present?
			@room.delete
			render :json=>{:response=>"success"}
		else
			render :json=>failure1(@room.errors)
		end
	end
	
	#To approve the host ads
	def ad_approval
  	if  params[:body][:is_approved] == "true"
		 @room = Room.find_by_id(params[:id])
		 if @room.update_attributes(:is_approved => true, :approver_id => @current_user.id)
		  render :json=>{:response=>"approved"}
		 else
		   render :json=>failure1(@room.errors)
		 end
		else
			 @room = Room.find_by_id(params[:id])
			 p params[:body][:comment]
			@room.update_attributes(:is_approved => false, :approver_id => @current_user.id, :comment=>params[:body][:comment])
      if @room.save			
			  render :json=>{:response=>"rejected"}
			else
				 render :json=>failure1(@room.errors)
			 end
		end
	end
	
	#To invite the franchisee
	def invite_franchisee
		@user = User.new(params[:body])
		@user.confirmed_at = DateTime.now
		@user.permalink =Digest::SHA1.hexdigest("params[:body][:user_name] Time.now")  
    @user.password_confirmation=params[:body][:password]
    @user.step="4"
    @user.roles << Role.find_by_name('Franchisee')
    if @user.save
			InviteFranchisee.invite_franchisee(@user.email,@user.user_name,@user.password,@user.area_code).deliver
			render :json=>{:response=>"success"}
		else
		 render :json=>failure1(@user.errors)
	 end
	end
	
	#To invite the host
	def invite_host
		 @user=User.find_by_id(@current_user)
		 Invitation.invite(params[:body][:email],params[:body][:subject],@user.permalink).deliver
		 render :json=>{:response=>"success"}
	end
	
	#To display the franchisee list
  def franchisee_list
    role = Role.find_by_name("Franchisee")
    @user = role.users.where(:is_rejected=>'false')
  end
	
	#To display the host list
  def host_list
    role = Role.find_by_name("Host")
    @user = role.users
  end
  
	#To display the guest list
  def guest_list
    role = Role.find_by_name("Guest")
    @user = role.users
  end
  
	#To display the post ads
	def post_advertisement_list
    @room = Room.order("created_at DESC")
	end
 
 #To display the current user 
  def user_list
    @user = User.select('id,user_name,is_rejected').reject{|x| x.id == @current_user.id}
  end
	
	#list of categories
	def search
		@search_list=Room.category_list(params[:body][:search_type] )
		@attachments=[]
		@search_list.each do |search|
  		@attachments << Attachment.find_attachments(search.id,search.type)
		end			 
	end
	
	#Search for categories
	def search_result
			  if (params["body"]["amenities"].empty? )
		case
			when params[:body][:name].present?  && params[:body][:country_id].blank? && params[:body][:state_id].blank? && params[:body][:city_id].blank? &&  params[:body][:no_of_persons].blank? && params[:body][:amenities].blank?
				condition = "type ILIKE (?) and name like (?) and is_approved in (?) and is_available in (?) and rooms.id NOT IN (?) and users.is_rejected = ? ",params[:body][:category],"%#{params[:body][:name]}%",true,true,RoomBooking.all.map(&:room_id),false
				
			when (params[:body][:name].present? && params[:body][:country_id].present? && params[:body][:state_id].blank? && params[:body][:city_id].blank? && params[:body][:no_of_persons].blank? && params[:body][:amenities].blank?)
				condition = "type ILIKE (?) and name like ? and is_approved = ? and users.country_id = ? and is_available in (?) and rooms.id NOT IN (?) and users.is_rejected = ?",params[:body][:category],"%#{params[:body][:name]}%",true,params[:body][:country_id].to_i,true,RoomBooking.all.map(&:room_id) ,false
				
			when (params[:body][:name].present? && params[:body][:country_id].present? && params[:body][:state_id].present? && params[:body][:city_id].blank?  && params[:body][:no_of_persons].blank? && params[:body][:amenities].blank?)
			  condition = "type ILIKE (?) and name like ? and is_approved = ? and users.country_id = ? and users.state_name ILIKE (?) and is_available in (?) and rooms.id NOT IN (?) and users.is_rejected = ?",params[:body][:category],"%"+params[:body][:name] +"%",true,params[:body][:country_id].to_i,params[:body][:state_id],true,RoomBooking.all.map(&:room_id),false
				
			when (params[:body][:name].present? && params[:body][:country_id].present? && params[:body][:state_id].present? && params[:body][:city_id].present?  && params[:body][:no_of_persons].blank? && params[:body][:amenities].blank?)
				condition = "type ILIKE (?) and name like ? and is_approved = ? and users.country_id = ? and users.state_name ILIKE (?) and users.city_name ILIKE (?) and is_available in (?) and rooms.id NOT IN (?) and users.is_rejected = ?",params[:body][:category],"%"+params[:body][:name] +"%",true,params[:body][:country_id].to_i,params[:body][:state_id],params[:body][:city_id],true,RoomBooking.all.map(&:room_id),false
				
			when params[:body][:country_id].present?  && params[:body][:name].blank? && params[:body][:state_id].blank? && params[:body][:city_id].blank?  && params[:body][:no_of_persons].blank? && params[:body][:amenities].blank?	
	      condition = "type ILIKE (?) and users.country_id = ? and is_approved in (?) and is_available in (?)  and rooms.id NOT IN (?) and users.is_rejected = ?",params[:body][:category],params[:body][:country_id].to_i,true,true,RoomBooking.all.map(&:room_id),false
				
		  when (params[:body][:country_id].present? && params[:body][:state_id].present? && params[:body][:city_id].blank? && params[:body][:name].blank? && params[:body][:no_of_persons].blank? && params[:body][:amenities].blank?)
        condition = "type ILIKE (?) and is_approved = ? and users.country_id = ? and users.state_name ILIKE ? and is_available in (?) and rooms.id NOT IN (?) and users.is_rejected = ? ",params[:body][:category],true,params[:body][:country_id].to_i,params[:body][:state_id],true,RoomBooking.all.map(&:room_id),false
				
				  when (params[:body][:country_id].present? && params[:body][:city_id].present? && params[:body][:state_id].blank? && params[:body][:name].blank? && params[:body][:no_of_persons].blank? && params[:body][:amenities].blank?)
        condition = "type ILIKE (?) and is_approved = ? and users.country_id = ? and users.city_name ILIKE ? and is_available in (?) and rooms.id NOT IN (?) and users.is_rejected = ?",params[:body][:category],true,params[:body][:country_id].to_i,params[:body][:city_id],true,RoomBooking.all.map(&:room_id),false
				
			when (params[:body][:country_id].present? && params[:body][:state_id].present? && params[:body][:city_id].present? && params[:body][:name].blank?  && params[:body][:no_of_persons].blank? && params[:body][:amenities].blank?)
			  condition = "type ILIKE (?) and is_approved = ? and users.country_id = ? and users.state_name ILIKE (?) and users.city_name ILIKE ? and is_available in (?)  and rooms.id NOT IN (?) and users.is_rejected = ?",params[:body][:category],true,params[:body][:country_id].to_i,params[:body][:state_id],params[:body][:city_id],true,RoomBooking.all.map(&:room_id) ,false
				
			when params[:body][:state_id].present?  && params[:body][:country_id].blank? && params[:body][:name].blank? && params[:body][:city_id].blank?  && params[:body][:no_of_persons].blank? && params[:body][:amenities].blank?
				condition = "type ILIKE (?) and users.state_name ILIKE ? and is_approved in (?) and is_available in (?)  and rooms.id NOT IN (?) and users.is_rejected = ? ",params[:body][:category],params[:body][:state_id],true,true,RoomBooking.all.map(&:room_id),false
				
			when params[:body][:city_id].present?  && params[:body][:country_id].blank? && params[:body][:name].blank? && params[:body][:state_id].blank?  && params[:body][:no_of_persons].blank? && params[:body][:amenities].blank?
				condition = "type ILIKE (?) and users.city_name ILIKE ? and is_approved in (?) and is_available in (?) and rooms.id NOT IN (?) and users.is_rejected = ?",params[:body][:category],params[:body][:city_id],true,true,RoomBooking.all.map(&:room_id),false 
				
						when params[:body][:city_id].present?  && params[:body][:state_id].present? && params[:body][:name].blank? &&  params[:body][:no_of_persons].blank? && params[:body][:country_id].blank? 
				condition = "type ILIKE (?) and users.city_name ILIKE ? and is_approved in (?) and is_available in (?) and users.state_name ILIKE (?)  and rooms.id NOT IN (?) and users.is_rejected = ? ",params[:body][:category],params[:body][:city_id],true,true,params[:body][:state_id],RoomBooking.all.map(&:room_id),false

				
		when params[:body][:check_in].present? && params[:body][:check_out].present? && params[:body][:city_id].blank?  && params[:body][:state_id].blank? && params[:body][:name].blank? &&  params[:body][:no_of_persons].blank? && params[:body][:country_id].blank?  && params[:body][:amenities].blank? 

				
			condition = "type ILIKE (?) and rooms.id NOT IN (?) and is_approved in (?) and is_available in (?) and users.is_rejected = ?",params[:body][:category],RoomBooking.all.map(&:room_id),true,true,false

					else 
									condition = "type ILIKE (?)and is_approved in (?) and is_available in (?) ","",true,true
		end
			end
		 if (params["body"]["amenities"].present? || params["body"]["no_of_persons"].present? && params["body"]["name"].empty?)
				case
						 when    params[:body][:no_of_persons].present? && params[:body][:city_id].blank?  && params[:body][:country_id].blank?  && params[:body][:state_id].blank? && params[:body][:amenities].blank?
			condition = "type ILIKE (?) and  is_approved in (?) and is_available in (?) and accommodates in (?)  and rooms.id NOT IN (?) and users.is_rejected = ? ",params[:body][:category],true,true, params[:body][:no_of_persons].to_i,RoomBooking.all.map(&:room_id),false
			
			  when   params[:body][:no_of_persons].present? && params[:body][:city_id].blank?  && params[:body][:country_id].present?  && params[:body][:state_id].blank? && params[:body][:amenities].blank?
			condition = "type ILIKE (?) and  is_approved in (?) and is_available in (?) and accommodates in (?) and users.country_id in (?) and rooms.id NOT IN (?) and users.is_rejected = ?",params[:body][:category],true,true,  params[:body][:no_of_persons],params[:body][:country_id].to_i,RoomBooking.all.map(&:room_id),false
			
							when    params[:body][:no_of_persons].present? && params[:body][:city_id].blank?  && params[:body][:country_id].present?  && params[:body][:state_id].present? && params[:body][:amenities].blank?
			condition = "type ILIKE (?) and  is_approved in (?) and is_available in (?) and accommodates in (?) and users.country_id in (?) and users.state_name ILIKE (?) and  rooms.id NOT IN (?) and users.is_rejected = ?",params[:body][:category],true,true, params[:body][:no_of_persons].to_i,params[:body][:country_id].to_i,params[:body][:state_id],RoomBooking.all.map(&:room_id),false
			
			 when    params[:body][:no_of_persons].present? && params[:body][:city_id].present?  && params[:body][:country_id].present?  && params[:body][:state_id].present? && params[:body][:name].empty? && params[:body][:amenities].empty?
			condition = "type ILIKE (?) and  is_approved in (?) and is_available in (?) and accommodates in (?) and users.country_id in (?) and users.state_name ILIKE (?) and users.city_name ILIKE (?) and rooms.id NOT IN (?)and users.is_rejected = ? ",params[:body][:category],true,true, params[:body][:no_of_persons].to_i,params[:body][:country_id].to_i,params[:body][:state_id],params[:body][:city_id],RoomBooking.all.map(&:room_id),false 
			
			
			when    params[:body][:no_of_persons].present? && params[:body][:state_id].present?  && params[:body][:country_id].blank?  && params[:body][:city_id].blank? && params[:body][:amenities].blank?
			condition = "type ILIKE (?) and  is_approved in (?) and is_available in (?) and accommodates in (?) and users.state_name ILIKE (?)and rooms.id NOT IN (?) and users.is_rejected = ? ",params[:body][:category],true,true, params[:body][:no_of_persons].to_i,params[:body][:state_id],RoomBooking.all.map(&:room_id),false
			
									when    params[:body][:no_of_persons].present? && params[:body][:city_id].present?  && params[:body][:country_id].blank?  && params[:body][:state_id].blank? && params[:body][:amenities].blank?
			condition = "type ILIKE (?) and  is_approved in (?) and is_available in (?) and accommodates in (?) and users.city_name ILIKE (?) and rooms.id NOT IN (?) and users.is_rejected = ?",params[:body][:category],true,true, params[:body][:no_of_persons].to_i,params[:body][:city_id],RoomBooking.all.map(&:room_id),false 
			
												when    params[:body][:no_of_persons].present? && params[:body][:city_id].present?  && params[:body][:country_id].present?  && params[:body][:state_id].blank? && params[:body][:amenities].blank?
			condition = "type ILIKE (?) and  is_approved in (?) and is_available in (?) and accommodates in (?) and users.city_name ILIKE (?) and users.country_id in (?) and rooms.id NOT IN (?) and users.is_rejected = ?",params[:body][:category],true,true, params[:body][:no_of_persons].to_i,params[:body][:city_id],params[:body][:country_id],RoomBooking.all.map(&:room_id),false
			
					when    params[:body][:amenities].present? && params[:body][:city_id].blank?  && params[:body][:country_id].blank?  && params[:body][:state_id].blank? && params[:body][:no_of_persons].blank?
			condition = "is_approved in (?) and is_available in (?) and amenities.name in (?)and rooms.id NOT IN (?) and rooms.id NOT IN (?) and users.is_rejected = ?",true,true, params[:body][:amenities],RoomBooking.all.map(&:room_id),false
        
					when      params["body"]["amenities"].present? &&   params["body"]["country_id"].present? && params["body"]["state_id"].empty? && params["body"]["city_id"].empty? && params["body"]["no_of_persons"].empty? 
			condition = "is_approved in (?) and is_available in (?) and amenities.name in (?) and users.country_id in (?) and rooms.id NOT IN (?) and users.is_rejected = ?",true,true, params[:body][:amenities],params[:body][:country_id].to_i,RoomBooking.all.map(&:room_id),false
			
					when   params["body"]["amenities"].present? &&   params["body"]["country_id"].present? && params["body"]["state_id"].present? &&  params["body"]["city_id"].empty?
			condition = "is_approved in (?) and is_available in (?) and amenities.name in (?) and users.country_id in (?) and users.state_name ILIKE (?) and rooms.id NOT IN (?) and users.is_rejected = ?",true,true, params[:body][:amenities],params[:body][:country_id].to_i, params[:body][:state_id],RoomBooking.all.map(&:room_id) ,false
			
								when   params["body"]["amenities"].present? &&   params["body"]["country_id"].present? && params["body"]["state_id"].present? && params["body"]["city_id"].present? &&  params["body"]["no_of_persons"].empty? 
			condition = "is_approved in (?) and is_available in (?) and amenities.name in (?) and users.country_id in (?) and users.state_name ILIKE (?) and users.city_name ILIKE (?) and rooms.id NOT IN (?) and users.is_rejected = ?",true,true, params[:body][:amenities],params[:body][:country_id].to_i, params[:body][:state_id],params[:body][:city_id],RoomBooking.all.map(&:room_id),false
			
		when   params["body"]["amenities"].present? &&   params["body"]["country_id"].present? && params["body"]["state_id"].present? && params["body"]["city_id"].present? && params["body"]["no_of_persons"].present? 
			condition = "is_approved in (?) and is_available in (?) and amenities.name in (?) and users.country_id in (?) and users.state_name ILIKE (?) and users.city_name ILIKE (?) and accommodates in (?) and rooms.id NOT IN (?) and users.is_rejected = ?",true,true, params[:body][:amenities],params[:body][:country_id].to_i, params[:body][:state_id],params[:body][:city_id],params[:body][:no_of_persons].to_i,RoomBooking.all.map(&:room_id) ,false
			
			when   params["body"]["amenities"].present? &&   params["body"]["country_id"].empty? && params["body"]["state_id"].present? && params["body"]["city_id"].empty? && params["body"]["no_of_persons"].empty? 
			condition = "is_approved in (?) and is_available in (?) and amenities.name in (?) and users.state_name ILIKE (?) and rooms.id NOT IN (?) and users.is_rejected = ?",true,true, params[:body][:amenities],params[:body][:state_id],RoomBooking.all.map(&:room_id),false
			
						when   params["body"]["amenities"].present? &&   params["body"]["country_id"].empty? && params["body"]["state_id"].empty? && params["body"]["city_id"].present? && params["body"]["no_of_persons"].empty? 
			condition = "is_approved in (?) and is_available in (?) and amenities.name in (?) and users.city_name ILIKE (?) and rooms.id NOT IN (?) and users.is_rejected = ?",true,true, params[:body][:amenities],params[:body][:city_id],RoomBooking.all.map(&:room_id) ,false
			
				when   params["body"]["amenities"].present? &&   params["body"]["country_id"].present? && params["body"]["state_id"].empty? && params["body"]["city_id"].present? && params["body"]["no_of_persons"].empty? 
			condition = "is_approved in (?) and is_available in (?) and amenities.name in (?) and users.city_name ILIKE (?) and users.country_id in (?) and rooms.id NOT IN (?) and users.is_rejected = ?",true,true, params[:body][:amenities],params[:body][:city_id],params[:body][:country_id].to_i,RoomBooking.all.map(&:room_id),false
			
			when   params["body"]["amenities"].present? &&   params["body"]["country_id"].empty? && params["body"]["state_id"].empty? && params["body"]["city_id"].empty? && params["body"]["no_of_persons"].present? 
			condition = "is_approved in (?) and is_available in (?) and amenities.name in (?) and accommodates in (?) and rooms.id NOT IN (?) and users.is_rejected = ?",true,true, params[:body][:amenities],params[:body][:no_of_persons],RoomBooking.all.map(&:room_id) ,false
		end
     end
	  if (params["body"]["amenities"].empty? )
				@search_result=  Room.search_result(condition) 
		 			else
			@search_result=Accommodation.search_result(condition)
		end
				@attachments=[]
		@search_result.each do |search|
			  @attachments << Attachment.find_attachments(search.id,search.type)
			end		
	 end
	
	#Find email for host and guest
   def contact_search
		 @ad=Room.contact_search(params["body"]["ad_id"])
		 @host=@ad.user
     @guest=@current_user
	 end		 
	 

	#Sending mail to corresponding Host 
	def contact_mail
		@category_type=Room.find_by_id(params["body"]["id"].to_i)
		@host=@category_type.user
		Guest.contact_host(@host.email,params["body"]["to"],params["body"]["message"]).deliver
		render :json=>{:response=>"success"}
		end
		
end
