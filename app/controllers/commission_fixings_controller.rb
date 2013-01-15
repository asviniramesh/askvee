class CommissionFixingsController < ApplicationController
  before_filter :current_user 
  
  #To show all commission fixing
  def index
    @commission_fixings = CommissionFixing.all
  end
 
 #To showing a particular record
  def show
    @commission_fixing = CommissionFixing.find(params[:id])   
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

#To create new commission fixing
  def new
    @commission_fixing = CommissionFixing.new
  end
 
 #To edit the existing record
  def edit
    @commission_fixing = CommissionFixing.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end
  
  #To create the commission fixing
  def create
    @commission_fixing = CommissionFixing.new(params[:commission_fixing])
    if @commission_fixing.save
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@commission_fixing.errors)
    end 
  end

#To update the edited commission fixing
  def update
    @commission_fixing = CommissionFixing.find(params[:id])
    if @commission_fixing.update_attributes(params[:commission_fixing])
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@commission_fixing.errors)
    end 
  end
 
 #To destroy the record
  def destroy
    @commission_fixing = CommissionFixing.find(params[:id])
    if @commission_fixing.destroy
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(:record=>"Record not found")
    end    
  end
  
end