class HostsController < ApplicationController
	 before_filter :current_user 
#Host can updating the calender 
	def calendar_updation
		commit = params[:body][:commit]
		p "$$$$$$$$$$$$$$$$$$$$$$$$"
		p commit
		date=[]
		@date=params[:body][:date]
		@property_type=params[:body][:property_type]
		case commit
			when "Booked"
			@date.each do|date|
		   @room_booking = RoomBooking.new(:room_id=>@property_type,:check_in=>date.to_date, :check_out=>date.to_date)
			 @room_booking.is_accepted=true
		   @room_booking.save
			end
			 render :json=>{:response=>"Booked"}
		  when "Available"
			@date.each do|date|
		    @room_booking = RoomBooking.new(:room_id=>@property_type,:check_in=>date.to_date, :check_out=>date.to_date)
  			@room_booking.is_accepted=false
				@room_booking.save
			end
			 render :json=>{:response=>"Available"}
		  when "Un-Available"
			@date.each do|date|
		    @room_booking = RoomBooking.new(:room_id=>@property_type,:check_in=>date.to_date, :check_out=>date.to_date)
				@room_booking.is_unavailable=true
				@room_booking.save
			end
			render :json=>{:response=>"Un-Available"}
		end
	end
	
#List of the accomodation for current user
	def room_list
		@room = Accommodation.find_all_by_host_id(@current_user.id)
		@date = RoomBooking.find_all_by_room_id(@room)
 	end
	
	def bookings
	@bookings= RoomBooking.find(:all,:conditions=>["host_id in (?) and is_accepted in (?)",@current_user.id,false])
	unless @bookings.nil?
	 render :json=>{:response=>@bookings}
	 end
	end
	
	
	def view_guest_profile
		@id=params["body"]["guest_id"]
  @user=User.find_by_id(@id)
	@my_accounts = @user
	@list_of_bookings=@user.room_bookings.find(:all,:conditions=>["is_accepted in (?)",true])
	end
	
	def ad_approval
  	if  params[:body][:is_accepted] == "true"
			@room = RoomBooking.find_by_id(params[:id])
			 if @room.update_attributes(:is_accepted => true)
				 Host.accept_booking(@room).deliver
				 Host.accept_booking_request(@room).deliver
		    render :json=>{:response=>"approved"}
		  else
		   render :json=>failure1(@room.errors)
		  end
		else
			@room = RoomBooking.find_by_id(params[:id])
			@room.update_attributes(:is_accepted => false, :comments=>params[:body][:comment])
			Host.cancel_booking(@room).deliver
			Host.reject_booking(@room).deliver
     if @room.save			
			  render :json=>{:response=>"rejected"}
			else
				 render :json=>failure1(@room.errors)
			 end

		end
	end
	
	
	
end
