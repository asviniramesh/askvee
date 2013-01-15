class GreenProfilesController < ApplicationController
 before_filter :authorized_user
 
 #To display the search result and display the all green profile
  def index
    unless params['body']['search'].blank?
     @green_profiles = GreenProfile.where(["name ILIKE ?","%#{params['body']['search']}%"])
    else
    @green_profiles =GreenProfile.order('created_at ASC')
     end
  end

#To display the particular greeen profile
  def show
    @green_profile = GreenProfile.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

#To create the new green profile
  def new
    @green_profile = GreenProfile.new
  end
  
  #To edit the green profile
  def edit
    @green_profile = GreenProfile.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end
  
  #To create the new green profile
  def create
    @green_profile = GreenProfile.new(params[:green_profile])
    if @green_profile.save
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@green_profile.errors)
    end 
  end

#To update the edited green profile
  def update
    @green_profile = GreenProfile.find(params[:id])
     if @green_profile.update_attributes(:name=>params[:body][:name])
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@green_profile.errors)
    end 
  end
  
  #To destroy the particular green profile
  def destroy
    @green_profile = GreenProfile.find(params[:id])
    @rooms=@green_profile.room_green_profiles
    if @green_profile.present? && @rooms.present?
      render :json=>{:response=>"Not deleted"}
    else
       @green_profile.destroy
      render :json=>{:response=>"success"}
    end    
  end
  
end