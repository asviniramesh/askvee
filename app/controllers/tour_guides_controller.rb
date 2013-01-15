class TourGuidesController < ApplicationController
  before_filter :current_user
 
	#Tourguide controller for fetch all values
  def index
		@user=User.find_by_id(@current_user)
    @tour_guides = TourGuide.all
  end

#Show method to fetch particular values
  def show
    @tour_guide = TourGuide.find_by_id(params[:id])
		attachment=Attachment.find_all_by_attachable_id_and_attachable_type(@tour_guide.id,"TourGuide")
		@attachment=[]
		@id = []
		@attach_id = Hash.new
		attachment.each do |attach|
      @attach_id = {:attach=> attach.image(:avatar).to_s,:id => attach.id }
		 	@attachment << @attach_id
		end
		@attachments=@attachment
  end
  
#Create new tourguide
  def new
    @tour_guide = TourGuide.new
  end

#Edit the tourguide
  def edit
    @tour_guide = TourGuide.find(params[:id])
  end

#Create tourguide by host
  def create
   @user = User.find_by_id(@current_user)
   @tour_guide = @user.tour_guides.new(params[:body][:tour_guide])
	 if @tour_guide.save
		if params[:body][:file].present?
     params[:body][:file]["data"].each do |f|
		  unless f[:encoded].empty?
			 Attachment.create_file(f[:encoded],@tour_guide,f[:file_name])
      end
     end
    end
		Admin.tour("admin@askvee.com","TourGuide",@user.user_name,@tour_guide.description,@tour_guide.name,@tour_guide.is_available,@tour_guide.price).deliver
    unless @user.parent_id.blank? 
     @franchisee=User.find_by_id(@user.parent_id)
     Franchisee.notification(@franchisee.email,"BreakFast",@user.user_name,@tour_guide.description,@tour_guide.name,@tour_guide.is_available,@tour_guide.price).deliver
    end
	  render :json=>success1
   else
		render :json=>failure1(@tour_guide.errors)
	 end
 end

#Update the tourguide by host
 def update
   @tour_guide = TourGuide.find_by_id(params[:id])
   if @tour_guide.update_attributes(:name=>params[:body][:name],:is_available=>params[:body][:is_available]=="Yes" ? true : false,:description=>params[:body][:description],:price=>params[:body][:price],:is_specific_location=>params[:body][:is_specific_location],:currency=>params[:body][:currency])
     if params[:body][:files].present?
			params[:body][:files]["data"].each do |f|
			 logger.info(f[:file_name])
			 logger.info(f[:encoded])
			 unless f[:encoded].empty?
			  Attachment.create_file(f[:encoded],@tour_guide,f[:file_name])
			 end
		 end
	  end
   	render :json=>{:response=>"success"}
   else
     render :json=>failure1(@tour_guide.errors)
   end 
  end

#Delete the tourguide by host
  def destroy
    @tour_guide = TourGuide.find_by_id(params[:id])
    if @tour_guide.present?
      @tour_guide.destroy
      render :json=>{:response=>"success"}
		end
  end
	
end