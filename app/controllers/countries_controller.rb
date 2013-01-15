class CountriesController < ApplicationController
 before_filter :current_user ,:except=>[:address]
 
 #To display the search result
  def index
   unless params['body']['search'].blank?
    @countries = Country.where(["name ILIKE ?","%#{params['body']['search']}%"])
    else
    @countries =Country.order('created_at ASC')
    end
  end

#To display the particular countries
  def show
    @country = Country.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

#To create a new country
  def new
    @country = Country.new
  end

#To edit the existing country
  def edit
    @country = Country.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

#To create the new country
  def create
    @country = Country.new(params[:country])
    if @country.save
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@country.errors)
    end
  end

#To update the edited record
  def update
    @country = Country.find(params[:id])
    if @country.update_attributes(:name=>params[:body][:country])
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@country.errors)
    end
  end

#To destroy the particular record
  def destroy
    @country = Country.find(params[:id])
    @user=@country.users
    if @country.present? && @user.present?
      render :json=>{:response=>"Not deleted"}
    else
      @country.destroy
       render :json=>{:response=>"success"}
    end
  end
  
#This method is used to fetch the country with the state, city, location, and area code
  def address
    @countries=Country.all
    @roles=Role.all
    if params[:body][:country_id].empty? && params[:body][:state_id].empty? && params[:body][:city_id].empty?
      render :json=>{:header=>{:status=>200},:body=>{:countries=>@countries, :roles=>@roles, :states=>nil}}
    elsif params[:body][:country_id].present? && params[:body][:state_id].empty? && params[:body][:city_id].empty?
      @states=Country.find_by_id(params[:body][:country_id]).states
      render :json=>{:header=>{:status=>200},:body=>{:countries=>@countries, :roles=>@roles, :states=>@states}}
    elsif params[:body][:country_id].present? && params[:body][:state_id].present? && params[:body][:city_id].empty?
      @states=Country.find_by_id(params[:body][:country_id]).states
      @cities=State.find_by_id(params[:body][:state_id]).cities
      render :json=>{:header=>{:status=>200},:body=>{:countries=>@countries, :roles=>@roles, :states=>@states, :cities=>@cities}}
    elsif params[:body][:country_id].present? && params[:body][:state_id].present? && params[:body][:city_id].present?
      @states=Country.find_by_id(params[:body][:country_id]).states
      @cities=State.find_by_id(params[:body][:state_id]).cities
      @locations=City.find_by_id(params[:body][:state_id]).locations
      render :json=>{:header=>{:status=>200},:body=>{:countries=>@countries, :roles=>@roles, :states=>@states, :cities=>@cities, :locations=>@locations}}
    end
  end

end