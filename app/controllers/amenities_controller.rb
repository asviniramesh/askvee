class AmenitiesController < ApplicationController
 before_filter :current_user 
  
  #To display the all amenities and show the search results
  def index
    unless params['body']['search'].blank?
     @amenities = Amenity.where(["name ILIKE ?","%#{params['body']['search']}%"])
    else
     @amenities =Amenity.order('created_at ASC')
    end
  end
  
  #To show the particular amenity
  def show
    @amenity = Amenity.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

#To assign the values for amenity
  def new
    @amenity = Amenity.new
  end

#To edit the existing amenity 
  def edit
    @amenity = Amenity.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

#To create the amenity
  def create
    @amenity = Amenity.new(params[:amenity])
    if @amenity.save
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@amenity.errors)
   end 
  end
 
 #To update the edit amenity
  def update
    @amenity = Amenity.find(params[:id])
    if @amenity.update_attributes(:name=>params[:body][:amenity])
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@amenity.errors)
    end 
  end

#To destroy the particular amenity
  def destroy
    @amenity = Amenity.find(params[:id])
    @amenity_room = @amenity.room_amenities 
    if @amenity_room.present?  && @amenity.present?
      render :json=>{:response=>"Not deleted"}
    else
      @amenity.destroy
      render :json=>{:response=>"success"}
    end    
  end
  
end