class CitiesController < ApplicationController
  before_filter :current_user , :except=>[:new]
  
  #To display the search results and all the cities
  def index
   unless params['body']['search'].blank?
    @cities = City.where(["name ILIKE ?","%#{params['body']['search']}%"])
    else
    @cities = City.order('created_at ASC')
    end
  end

#To showing the particular city
 def show
    @city = City.find(params[:id])
    @state =@city.state
    @country=@state.country
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

#To select the state and city 
  def new
    @cities=State.find_by_id(params[:body][:id]).cities.select("id, name")
    render :json=>success1(:cities=>@cities)
  end

#To edit the existing record
  def edit
    @city = City.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

#To create the new city
  def create
    unless params[:country_id]
      @city = City.new(params[:city])
      @city.step="2"
      state = State.find_by_id(params[:city][:state_id]) if params[:city][:state_id]
      @city.state = state
      if @city.save
       render :json=>{:response=>"success"}
      else
       render :json=>failure1(@city.errors)
      end
    end
  end

#To update the edited record
  def update
    @city = City.find(params[:id])
    if @city.update_attributes(:name=>params[:body][:name],:step=>"1")
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@city.errors)
    end
  end

#To destroy the particular record
  def destroy
    @city = City.find(params[:id])
    @user = @city.users
    if @city.present? && @user.present?
      render :json=>{:response=>"Not deleted"}
    else
      @city.destroy
      render :json=>{:response=>"success"}
    end
  end
  
  #To display the all state
  def state_list
    @state_list=State.find_all_by_country_id(params[:city][:value])
  end
  
end