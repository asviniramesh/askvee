class Room < ActiveRecord::Base
  
 belongs_to :user, :foreign_key=>'host_id'
  has_many :room_bookings, :class_name => "RoomBooking", :dependent => :destroy


	def self.find_booking_availability(franchisee_id,ck_in,ck_out,country_id=nil,state_id=nil,city_id=nil,area_code=nil)
  a = (state_id.blank? ? "" : " AND rooms.state_id = #{state_id}")+(city_id.blank? ? "" : " AND rooms.city_id = #{city_id}")+(country_id.blank? ? "" : " AND rooms.country_id = #{country_id}")+(area_code.blank? ? "" : " AND rooms.area_code = #{area_code}")

  if a.blank?
  room = Room.find_by_sql("select rooms.* from rooms join users on users.id = rooms.host_id where users.parent_id = #{franchisee_id} AND not exists(select room_bookings.room_id from room_bookings where room_bookings.room_id = rooms.id AND is_accepted IS TRUE AND check_in >= '#{ck_in}' and check_out <= '#{ck_out}')")
  else
  room = Room.find_by_sql("select rooms.* from rooms join users on users.id = rooms.host_id where users.parent_id = #{franchisee_id} AND not exists(select room_bookings.room_id from room_bookings where room_bookings.room_id = rooms.id AND is_accepted IS TRUE AND check_in >= '#{ck_in}' and check_out <= '#{ck_out}') #{a}")
  end
  return room
  end

def self.find_is_available_area(franchisee_id,area_code,check_in,check_out)
    rooms = RoomBooking.where("host_id = ? AND room_bookings.check_in >= ? AND room_bookings.check_out <= ? ",franchisee_id,check_in,check_out)
    return rooms
end

	def self.category_list(category_type)
		@search_list= Room.find(:all,:conditions=>["type ILIKE (?) and is_approved in (?) and is_available in (?)",category_type,true,true])
  end

	def self.search_result(condition)
		#~ p category
		#~ p "RRRRRRRRRRRRRRR"
		#~ @search=self.where(condition).includes(:user)
	 #~ @search_list=self.where("type ILIKE (?) and rooms.id NOT IN (?) and users.country_id in (?)","Accommodation",RoomBooking.all.map(&:room_id),4).includes(:user)
	 	  @search_list=self.where(condition).includes(:user)


		#~ p @search_list=Room.where(" type ILIKE (?) and id NOT IN (?)",category,RoomBooking.all.map(&:room_id))

		#~ Accommodation.where("id NOT IN (?)",RoomBooking.all.map(&:room_id))

    return @search_list
  end	
	
	def self.contact_search(id)
		return self.find_by_id(id)
	end
	
	
	def self.find_revenue(franchisee_id,check_in,check_out)
		@user=User.find_by_parent_id(franchisee_id)
		unless @user.nil?
		@host_id=@user.id
		@bookings=@user.room_bookings.find(:all,:conditions=>["host_id = ? AND check_in >= ?  AND check_out <= ? ",@host_id,check_in,check_out])
		return @bookings
		end
	end
	
		
	
	
	
	
end
