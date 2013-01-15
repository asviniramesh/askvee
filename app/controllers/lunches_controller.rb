	class LunchesController < ApplicationController
 before_filter :current_user 
		
		def create
			@user=User.find_by_id(@current_user)
	      @lunch=@user.lunches.new(params[:body][:lunch])
				if @lunch.save
			if params[:body][:files].present?
				params[:body][:files]["data"].each do |f|
						unless f[:encoded].empty?
						 #~ if @lunch.attachments.empty?
							
							 Attachment.create_file(f[:encoded],@lunch,f[:file_name])
						 #~ else
							 #~ Attachment.update_file(f[:encoded],@lunch,f[:file_name])
					 end
			   end
		  end
	      Admin.lunch("admin@askvee.com","Lunch",@user.user_name,@lunch.description,@lunch.name,@lunch.is_available,@lunch.price).deliver
				unless @user.parent_id.blank? 
					@franchisee=User.find_by_id(@user.parent_id)
					Franchisee.notification(@franchisee.email,"BreakFast",@user.user_name,@breakfast.description,@breakfast.name,@breakfast.is_available,@breakfast.price).deliver
				end
	      render :json=>{:response=>"success"}
    	else
				render :json=>failure1(@lunch.errors)
				end
	end
	
		def show
			@lunch=Lunch.find_by_id(params[:id])
				@my_accounts=@lunch.user
				 attachment=Attachment.find_all_by_attachable_id_and_attachable_type(@lunch.id,"Lunch")
			 @attachment=[]
			 @id = []
			 @attach_id = Hash.new
			 attachment.each do |attach|
			 #@attachment << attach.image(:avatar).to_s
			 #@id << attach.id
        @attach_id = {:attach=> attach.image(:avatar).to_s,:id => attach.id }
			 	@attachment << @attach_id
			 end
			 @attachments=@attachment
		end
	
	def update
		p params[:body]
		p "FFFFFFFFFFF"
	@lunch = Lunch.find_by_id(params[:body][:lunch][:id])
	if @lunch.update_attributes(:description=>params[:body][:lunch][:description],:is_available=>params[:body][:lunch][:is_available]=="Yes" ? true : false,:name=>params[:body][:lunch][:name],:price=>params[:body][:lunch][:price],:currency=>params[:body][:lunch][:currency])
		p "DDDDDDDDDDDD"
		p @lunch
		if params[:body][:files].present?
				params[:body][:files]["data"].each do |f|
						unless f[:encoded].empty?
						 #~ if @lunch.attachments.empty?
							
							 Attachment.create_file(f[:encoded],@lunch,f[:file_name])
						 #~ else
							 #~ Attachment.update_file(f[:encoded],@lunch,f[:file_name])
					 end
			   end
		  end
	render :json=>success1
	else
		render :json=>failure1(@lunch.errors)
		end
	end
	
	 def index
   @user=User.find_by_id(@current_user)
	 @lunches=@user.lunches.order('created_at ASC')
	end
	
	def destroy
    @lunch = Lunch.find(params[:id])
      if @lunch.destroy
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(:record=>"Record not found")
      end
  end
	
	
	
	end
