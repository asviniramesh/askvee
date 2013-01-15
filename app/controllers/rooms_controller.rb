class RoomsController < ApplicationController
 before_filter :current_user 
  ####create New rooms #########
  def create
@green=Array.new
@green=params[:body][:green_profile]
@length= @green.length
    file=[]
    @green_profile=[]
    @user = User.find_by_id(@current_user)
   @rooms=@user.accommodations.build(params[:body][:user].except('action','controller','image'))
    if @rooms.save
     @rooms.update_attributes(:length=>@length)
     file=params[:body][:file]
   		unless file[:encoded].empty?
      #if @rooms.attachments.empty?
			  Attachment.create_file(file[:encoded],@rooms,file[:file_name])
			 #else
				#Attachment.update_file(file[:encoded],@rooms,file[:file_name])
			 #end
      end
      green_profile_id=[]
      green_profile_id = params[:body][:green_profile]
      amenity_id=[]
      amenity_id = params[:body][:amenity]
      @room_id=@rooms.id
       green_profile_id.each do |id|      
      RoomGreenProfile.create(:room_id=>@room_id, :green_profile_id=>id)
     end
    amenity_id.each do |id|
      RoomAmenity.create(:room_id=>@room_id, :amenity_id=>id)
      end
      Admin.accomodation("arun.s@railsfactory.org","Accommodation",@user.user_name,@rooms.description,@rooms.price).deliver
      unless @user.parent_id.blank? 
					@franchisee=User.find_by_id(@user.parent_id)
					Franchisee.notification(@franchisee.email,"Accommodation",@user.user_name,@rooms.description,@rooms.name,@rooms.is_available,@rooms.price).deliver
				end
     render :json=>success1
    else
      render :json=>failure1(@rooms.errors)
    end
 end
  
  def show
    @room = Accommodation.find_by_id(params[:id])
    @property = @room.property
    @green_profile_name=@room.green_profiles
    #~ @green_profile = RoomGreenProfile.find_all_by_room_id(@room)
    #~ unless @green_profile[0].green_profile_id.nil?
     #~ profile = @green_profile[0].green_profile_id
     #~ @green_profile_name = []
     #~ profile.each do |profile|
     #~ @green_profile_name << GreenProfile.find_by_id(profile)  
    #~ end
   #~ end
   
   	 #~ @attachment=[]
			 #~ @id = []
			 #~ @attach_id = Hash.new
			 #~ attachment.each do |attach|
			 #~ #@attachment << attach.image(:avatar).to_s
			 #~ #@id << attach.id
        #~ @attach_id = {:attach=> attach.image(:avatar).to_s,:id => attach.id }
			 	#~ @attachment << @attach_id
			 #~ end
			 #~ @attachments=@attachment

   
   	 attachment=Attachment.find_all_by_attachable_id_and_attachable_type(@room.id,"Accommodation")
       @attach_image=Hash.new
       unless attachment.nil?
			 attachment.each do |attach|
       @attach_image={:attach=>attach.image(:avatar).to_s,:id=>attach.id}
      end
      end
			 @attachments=@attach_image
    @amenity_name = @room.amenities
    #~ unless @amenity[0].amenity_id.nil?
     #~ amenity = @amenity[0].amenity_id
     #~ @amenity_name = []
     #~ amenity.each do |profile|
     #~ @amenity_name << Amenity.select("name, id").find_by_id(profile)
   #~ end
 #~ end
 #~ @amenity_name
    @attachment = @room.attachments.first
    if !@room.present?
      render :json=>failure1(:record=>"Record not found")
    end
  end
 
 def update
  @green=Array.new
@green=params[:body][:room][:green_profile_name]
@length= @green.length
  @room = Accommodation.find_by_id(params[:id])
 if @room.update_attributes(:name=>params[:body][:room][:name],:address=>params[:body][:room][:address],:room_type=>params[:body][:room][:role_type],:description=>params[:body][:room][:description],:area_code=>params[:body][:room][:area_code],:price=>params[:body][:room][:price], :property_id=>params[:body][:room][:property_id], :is_available=>params[:body][:room][:is_available]=='Yes'? true: false,:currency=>params[:body][:room][:currency],:accommodates=>params[:body][:room][:accommodates],:length=>@length)
      @green=RoomGreenProfile.find_all_by_room_id(@room.id)
      @green_name = params[:body][:room][:green_profile_name]
      unless @green.nil?
      @green.each do |green|
       green.destroy
      end
     end
     unless @green_name.nil?
      @green_name.each do |id|      
      RoomGreenProfile.create(:room_id=>@room.id, :green_profile_id=>id.to_i)
     end
     end
      @room_amenity=RoomAmenity.find_all_by_room_id(@room.id)
       @amenity_name=params[:body][:room][:amenity_name]
       
       p @room_amenity
       unless @room_amenity.nil?
      @room_amenity.each do |amenity|
       amenity.destroy
      end
     end
      unless @amenity_name.nil?
      @amenity_name.each do |id|
      RoomAmenity.create(:room_id=>@room.id, :amenity_id=>id.to_i)
     end
     end
      file = params[:body][:file]
  unless file[:encoded].empty?
    #if @room.attachments.empty?
      Attachment.create_file(file[:encoded],@room,file[:file_name])
     #else
      #Attachment.update_file(file[:encoded],@room,file[:file_name])
     #end
   end
   render :json=>{:response=>"success"}
   else
   render :json=>failure1(@room.errors)
    end
  end

  # Accommodation index 
  def index
    @rooms = @current_user.accommodations.order('created_at DESC')
    render :json=>failure1 unless @rooms.present?
  end
  
  #Delete the accommodations by host
  def destroy
    @room = Accommodation.find_by_id(params[:id])
    if @room.present?
      @room.destroy
      render :json=>{:response=>"success"}
    end
  end

end


