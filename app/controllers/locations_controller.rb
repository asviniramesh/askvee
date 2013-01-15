class LocationsController < ApplicationController
  before_filter :authorized_user, :except=>[:new]
  
  def index
    unless params['body']['search'].blank?
     @locations = Location.where(["area_code ILIKE ?","%#{params['body']['search']}%"])
    else
     @locations = Location.order('created_at ASC')
    end
  end

  def show
    @location = Location.find(params[:id])
    #@city =@location.city
    #@state=@city.state
    @country=@location.country
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

  def new
    @locations = Country.find_by_id(params[:body][:id]).locations.select("id,name,area_code")
    render :json=>success1(:locations=>@locations)
  end

 def edit
    @location = Location.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

  def create
    unless params[:country_id] && params[:state_id]
    @location = Location.new(params[:location])
    @location.step="2"
    p @location
    country = Country.find_by_id(params[:location][:country_id]) if params[:location][:country_id]
    p @location.country = country
    if @location.save
      render :json=>{"response"=> "success"}
    else
      render :json=>failure1(@location.errors)     
    end
    end
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(:name=>params[:body][:name],:area_code=>params[:body][:area_code],:step=>"1")
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@location.errors)
    end
 end

  def destroy
    @location = Location.find(params[:id])
    @user = @location.users
    
    if @location.present? && @user.present?
      render :json=>{:response=>"Not deleted"}
    else
      @location.destroy
      render :json=>{:response=>"success"}
   end
 end
  
  def city_list
    @city_list = City.find_all_by_state_id(params[:city][:state_id]) if params[:city][:state_id]
  end
  
  def location_list
    @location_list=		Location.find_all_by_city_id(params[:location][:city_id]) if params[:location][:city_id]  
  end
  
end