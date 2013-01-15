class LessonsController < ApplicationController
	before_filter :current_user 
	
	#To create the lessons
	def create
		@user=User.find_by_id(@current_user)
	  @lesson=@user.lessons.new(params[:body][:lesson])
	  if @lesson.save
			if params[:body][:files].present?
				params[:body][:files]["data"].each do |f|
						unless f[:encoded].empty?
					    Attachment.create_file(f[:encoded],@lesson,f[:file_name])
					 end
			   end
		  end
	    Admin.lesson("admin@askvee.com","Lesson",@user.user_name,@lesson.description,@lesson.name,@lesson.is_available,@lesson.price).deliver
			unless @user.parent_id.blank? 
				@franchisee=User.find_by_id(@user.parent_id)
				Franchisee.notification(@franchisee.email,"Lesson",@user.user_name,@lesson..description,@lesson..name,@lesson.t.is_available,@lesson.price).deliver
			end
	      render :json=>{:response=>"success"}
   	else
			render :json=>failure1(@lesson.errors)
		end
	end
	
	#To show the particular lesson
	def show
    @lesson=Lesson.find_by_id(params[:id])
		@my_accounts=@lesson.user
	  attachment=Attachment.find_all_by_attachable_id_and_attachable_type(@lesson.id,"Lesson")
 		@attachment=[]
		@id = []
		@attach_id = Hash.new
		attachment.each do |attach|
      @attach_id = {:attach=> attach.image(:avatar).to_s,:id => attach.id }
		 	@attachment << @attach_id
		end
		 @attachments=@attachment 
  end
	
	#To update the edited lessons
	def update
	 @lesson = Lesson.find_by_id(params[:body][:lesson][:id])
   if	@lesson.update_attributes(:description=>params[:body][:lesson][:description],:is_available=>params[:body][:lesson][:is_available]=="Yes" ? true : false,:name=>params[:body][:lesson][:name],:price=>params[:body][:lesson][:price],:currency=>params[:body][:lesson][:currency])
		  if params[:body][:files].present?
				params[:body][:files]["data"].each do |f|
						unless f[:encoded].empty?
						 Attachment.create_file(f[:encoded],@lesson,f[:file_name])
					 end
			   end
		  end
	   render :json=>success1
	  else
		 render :json=>failure1(@lesson.errors)
	 end
 end
 
 #To display the all lessons
	def index
   @user=User.find_by_id(@current_user)
	 @lessons=@user.lessons.order('created_at DESC')
	end
	
	#To destroy the particular lesson
	def destroy
    @lesson = Lesson.find(params[:id])
    if @lesson.present?
			@lesson.destroy
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(:record=>"Record not found")
		end
  end
	
end