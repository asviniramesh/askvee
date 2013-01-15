class Host < ActionMailer::Base
  default from: "from@example.com"
  def booking_request(room_id,user_id,check_in,check_out,no_of_persons)
  @room_id=room_id
  @room=Room.find_by_id(@room_id)
  @host_id=@room.host_id
  @host=User.find_by_id(@host_id)
  @email=@host.email
  @user_id=user_id
  @user=User.find_by_id(@user_id)
  @guest=@user.email
  @guest_name=@user.user_name
  if @room.type=="Lunch"
    @name=@room.name
    @description=@room.description
    @check_in=check_in
    @check_out=check_out
    @no_of_persons=no_of_persons
    elsif @room.type=="Lesson"
      @name=@room.name
    @description=@room.description
    @check_in=check_in
    @check_out=check_out
    @no_of_persons=no_of_persons
    elsif @room.type=="TourGuide"
      @name=@room.name
    @description=@room.description
    @check_in=check_in
    @check_out=check_out
    @no_of_persons=no_of_persons
    elsif @room.type=="Dinner"
        @name=@room.name
    @description=@room.description
    @check_in=check_in
    @check_out=check_out
    @no_of_persons=no_of_persons
    elsif @room.type=="BreakFast"
         @name=@room.name
    @description=@room.description
    @check_in=check_in
    @check_out=check_out
    @no_of_persons=no_of_persons
    elsif @room.type=="Accommodation"
         @name=@room.name
    @description=@room.description
    @check_in=check_in
    @check_out=check_out
    @no_of_persons=no_of_persons
    end
    @user_name=@user.user_name
    @address=@user.address
    @mobile=@user.mobile_phone
    @phone=@user.home_phone
       mail(:to =>@email , :subject => "New Booking has been raised")  
  end
  
  def cancel_booking(room)
    @host=User.find_by_id(room.host_id)
    @host_user_name=@host.user_name
  @guest=User.find_by_id(room.guest_id)
   @guest_user_name=@guest.user_name
   @guest_address=@guest.address
   @guest_first_name=@guest.first_name
   @guest_last_name=@guest.last_name
   @guest_mobile_phone=@guest.mobile_phone
   @guest_home_phone=@guest.home_phone
   @check_in=room.check_in
   @check_out=room.check_out
   @no_of_persons=room.no_of_person
   @no_of_days=room.no_of_days
   @ad_id=room.room_id
   @room_details=Room.find_by_id(room.room_id)
   @room_name=@room_details.name
   @room_description=@room_details.description
     mail(:to =>"parthiban@railsfactory.org" , :subject => "Booking has rejected")  
  end
  
  def reject_booking(room)
    @host=User.find_by_id(room.host_id)
    @host_user_name=@host.user_name
  @guest=User.find_by_id(room.guest_id)
  @email=@guest.email
   @guest_user_name=@guest.user_name
   @guest_address=@guest.address
   @guest_first_name=@guest.first_name
   @guest_last_name=@guest.last_name
   @guest_mobile_phone=@guest.mobile_phone
   @guest_home_phone=@guest.home_phone
   @check_in=room.check_in
   @check_out=room.check_out
   @no_of_persons=room.no_of_person
   @no_of_days=room.no_of_days
   @ad_id=room.room_id
   @room_details=Room.find_by_id(room.room_id)
   @room_name=@room_details.name
   @room_description=@room_details.description
     mail(:to =>@email , :subject => "Your Booking has rejected")  
  end
  
  def accept_booking(room)
  @host=User.find_by_id(room.host_id)
    @host_user_name=@host.user_name
  @guest=User.find_by_id(room.guest_id)
   @guest_user_name=@guest.user_name
   @guest_address=@guest.address
   @guest_first_name=@guest.first_name
   @guest_last_name=@guest.last_name
   @guest_mobile_phone=@guest.mobile_phone
   @guest_home_phone=@guest.home_phone
   @check_in=room.check_in
   @check_out=room.check_out
   @no_of_persons=room.no_of_person
   @no_of_days=room.no_of_days
   @ad_id=room.room_id
   @room_details=Room.find_by_id(room.room_id)
   @room_name=@room_details.name
   @room_description=@room_details.description
     mail(:to =>"parthiban@railsfactory.org" , :subject => "Booking has accepted")
   end
   
   def accept_booking_request(room)
      @host=User.find_by_id(room.host_id)
    @host_user_name=@host.user_name
  @guest=User.find_by_id(room.guest_id)
  @email=@guest.email
   @guest_user_name=@guest.user_name
   @guest_address=@guest.address
   @guest_first_name=@guest.first_name
   @guest_last_name=@guest.last_name
   @guest_mobile_phone=@guest.mobile_phone
   @guest_home_phone=@guest.home_phone
   @check_in=room.check_in
   @check_out=room.check_out
   @no_of_persons=room.no_of_person
   @no_of_days=room.no_of_days
   @ad_id=room.room_id
   @room_details=Room.find_by_id(room.room_id)
   @room_name=@room_details.name
   @room_description=@room_details.description
     mail(:to =>@email , :subject => "Your Booking has accepted")  
   
   end
   
  
end
