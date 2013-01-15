class BreakfastsController < ApplicationController
before_filter :current_user 

#List out the breakfasts
def index
	@user=User.find_by_id(@current_user)
	@breakfasts=@user.break_fasts.order('created_at ASC')
end

#To create new breakfast
def new
end

#ad post for  breakfast
def create
	@user=User.find_by_id(@current_user)
	@breakfast=@user.break_fasts.new(params[:body][:breakfast])
	if @breakfast.save
	 if params[:body][:files].present?
		params[:body][:files]["data"].each do |f|
		 unless f[:encoded].empty?
			Attachment.create_file(f[:encoded],@breakfast,f[:file_name])
		 end
		end
	 end
		Admin.notification("admin@askvee.com","BreakFast",@user.user_name,@breakfast.description,@breakfast.name,@breakfast.is_available,@breakfast.price).deliver
		unless @user.parent_id.blank? 
		 @franchisee=User.find_by_id(@user.parent_id)
			Franchisee.notification(@franchisee.email,"BreakFast",@user.user_name,@breakfast.description,@breakfast.name,@breakfast.is_available,@breakfast.price).deliver
		end
		 render :json=>{:response=>"success"}
		else
		 render :json=>failure1(@breakfast.errors)
	end
end

#show the breakfast
 def show
	 @breakfast=BreakFast.find_by_id(params[:id])
	 @my_accounts=@breakfast.user
	 attachment=Attachment.find_all_by_attachable_id_and_attachable_type(@breakfast.id,"BreakFast")
	 @attachment=[]
	 @id = []
	 @attach_id = Hash.new
	 attachment.each do |attach|
		@attach_id = {:attach=> attach.image(:avatar).to_s,:id => attach.id }
		@attachment << @attach_id
	 end
		@attachments=@attachment
end
	
	#update the breakfast
	def update
		@breakfast = BreakFast.find_by_id(params[:id])
		if @breakfast.update_attributes(:description=>params[:body][:description],:name=>params[:body][:name],:price=>params[:body][:price],:is_available=>params[:body][:is_available]=="Yes" ? true : false,:currency=>params[:body][:currency])
			if params[:body][:files].present?
		  	 params[:body][:files]["data"].each do |f|
					 logger.info(f[:file_name])
					 logger.info(f[:encoded])
				  unless f[:encoded].empty?
						 Attachment.create_file(f[:encoded],@breakfast,f[:file_name])
				  end
				end
			end
			render :json=>{:response=>"success"}
		else
			render :json=>failure1(@breakfast.errors)
		end 
	end

	# Delete the breakfast
  def destroy
	 @breakfast = BreakFast.find_by_id(params[:id])
		if @breakfast.present?
			@breakfast.destroy
			 render :json=>{:response=>"success"}
		end
	end
	
end