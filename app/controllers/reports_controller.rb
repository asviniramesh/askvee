class ReportsController < ApplicationController
 
	#before_filter :authorized_user
  
	def room_availability
	@rooms = Room.find_booking_availability(params[:body][:franchisee_id],params[:body][:check_in].to_date,params[:body][:check_out].to_date,params[:body][:country_id],params[:body][:state_id],params[:body][:city_id],params[:body][:area_code])
  end
 
	# admin and franchisee rooms list
	def room_per_franchisee
	 @rooms = User.find_post_advertisement(params[:body][:franchisee_id])
  end	 
 
  # admin room request without state
	def room_request_list
		@room_request = RoomBooking.is_room(params[:body][:check_in].to_date,params[:body][:check_out].to_date)
	end
	
  # franchise room request without state
  def room_request_list_franchisee
    @room_request = RoomBooking.where("host_id = ? AND room_bookings.check_in >= ? AND room_bookings.check_out <= ?",params[:body][:franchisee_id],params[:body][:check_in].to_date,params[:body][:check_out].to_date)
	end
  
	# admin booking_request with state
	def access_booking
		@access_booking = RoomBooking.is_booked(params[:body][:check_in].to_date,params[:body][:check_out].to_date,params[:body][:is_accepted])
	end
	
  # franchisee booking_request with state
	def access_booking_franchisee
    @access_booking  = RoomBooking.where("host_id = ? AND room_bookings.check_in >= ? AND room_bookings.check_out <= ? AND room_bookings.is_accepted = ?",params[:body][:franchisee_id],params[:body][:check_in].to_date,params[:body][:check_out].to_date,params[:body][:is_accepted])
	end
  
	# Guest Host Access List
	def access_list_of_guest_host
	  @role = Role.find_by_id(params[:body][:role_id])
    @user = @role.users.where('users.created_at >= ? and users.created_at <= ?',params[:body][:from_date].to_date,params[:body][:to_date].to_date)
	end
	
  # franchisee - room availability per area
	def room_availability_in_area
	  @rooms = Room.find_is_available_area(params[:body][:franchisee_id],params[:body][:area_code],params[:body][:check_in].to_date,params[:body][:check_out].to_date)
	end
	
  #admin/franchisee -revenue per franchisee	
	def revenue_per_franchisee
		@revenue=Room.find_revenue(params[:body][:franchisee_id].to_i,params[:body][:check_in].to_date,params[:body][:check_out].to_date)
		unless @revenue.blank?
		render :json=>{:response=>success1(@revenue)}
			else
				render :json=>{:response=>"No record found"}
			end
			end
	
	
end
