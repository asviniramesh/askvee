class DinnersController < ApplicationController
  before_filter:current_user
	
 #Dinner controller for fetch all values
  def index
    @user=User.find_by_id(@current_user)
    @dinners = Dinner.all
  end

#Show method to fetch particular values
  def show
    @dinner = Dinner.find_by_id(params[:id])
		attachment=Attachment.find_all_by_attachable_id_and_attachable_type(@dinner.id,"Dinner")
		@attachment=[]
		@id = []
		@attach_id = Hash.new
		attachment.each do |attach|
      @attach_id = {:attach=> attach.image(:avatar).to_s,:id => attach.id }
		 	@attachment << @attach_id
		end
		@attachments=@attachment
    if !@dinner.present?
      render :json=>failure1(:record=>"Record not found")
    end
  end
  
#Create new dinner
  def new
    @dinner = Dinner.new
  end

#Edit the dinner
  def edit
    @dinner = Dinner.find(params[:id])
  end

#Create dinner by host
  def create
   @user = User.find_by_id(@current_user)
   @dinner = @user.dinners.new(params[:body][:dinner])
    if @dinner.save
     if params[:body][:file].present?
      params[:body][:file]["data"].each do |f|
		   unless f[:encoded].empty?
		    Attachment.create_file(f[:encoded],@dinner,f[:file_name])
       end
      end
     end
    Admin.dinner("arun.s@railsfactory.org","Dinner",@user.user_name,@dinner.description,@dinner.name,@dinner.is_available,@dinner.price).deliver
    unless @user.parent_id.blank? 
     @franchisee=User.find_by_id(@user.parent_id)
     Franchisee.dinner(@franchisee.email,"BreakFast",@user.user_name,@dinner.description,@dinner.name,@dinner.is_available,@dinner.price).deliver
    end
    render :json=>success1
   else
			render :json=>failure1(@dinner.errors)
   end
 end

#Update the dinner by host
 def update
  @dinner = Dinner.find_by_id(params[:id])
  if @dinner.update_attributes(:name=>params[:body][:name],:is_available=>params[:body][:is_available]=="Yes" ? true : false,:description=>params[:body][:description],:price=>params[:body][:price],:currency=>params[:body][:currency])
    if params[:body][:files].present?
    params[:body][:files]["data"].each do |f|
		 unless f[:encoded].empty?
		  Attachment.create_file(f[:encoded],@dinner,f[:file_name])
     end
   end
  end
   render :json=>{:response=>"success"}
  else
    render :json=>failure1(@dinner.errors)
   end 
end

#Delete the dinner by host
  def destroy
    @dinner = Dinner.find_by_id(params[:id])
    if @dinner.present?
      @dinner.destroy
      render :json=>{:response=>"success"}
		end
  end
  
end