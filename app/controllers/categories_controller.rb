class CategoriesController < ApplicationController
 before_filter :current_user , :except=>[:index, :show]
	
	#To show the search results and showing all categories
	def index
		unless params['body']['search'].blank?
     @categories = Category.where(["name ILIKE ?","%#{params['body']['search']}%"])
    else
     @categories =Category.order('created_at ASC')
    end
	end
	
	#To create new categories
	def new
  end
	
	#To create a category
	def create
		@create_category = Category.new(params[:category])
    if @create_category.save
      render :json=>{:response=>"success"}
    else
			render :json=>failure1(@create_category.errors)
   end 
 end
  
	#To show the category
	def show
    @category = Category.find_by_id(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end
	
	#To update the category
	def update
    @category = Category.find(params[:id])
    if @category.update_attributes(:name=>params[:body][:category])
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@category.errors)
    end 
  end

#To destroy the particular category
  def destroy
    @category = Category.find(params[:id])
    if @category.present?
      @category.destroy
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(:record=>"Record not found")
    end
  end
	
	#To display the all category lists
	def category_list
		@categories=Category.all
	end

end