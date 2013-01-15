class GuestsController < ApplicationController
 before_filter :current_user 

 #Guest feedback
  def feedback
	 @send_feedback=RoomBooking.feedback
	 @user_email=[]
	 @send_feedback.each do |get_email|
	  @user_email << User.find(get_email.guest_id,get_email.host_id).map(&:email)
	 end
   FeedbackHost.feedback_host(@user_email .flatten).deliver
  end

#Guest room booking status
  def booking_status 
   @bookings=RoomBooking.where("guest_id in (?)",@current_user.id)
   render:json=>{:response=>@bookings}
  end

#Guest post the feedback
  def feedback_post
	 @feedback = Feedback.new(params[:body][:feedback])
	  if @feedback.save
     render :json=>{:response=>"success"}
    else
     render :json=>failure1(@feedback.errors)
    end
  end

end