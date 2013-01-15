class PropertiesController < ApplicationController
	
	def index
   unless params['body']['search'].blank?
    @properties = Property.where(["property_type ILIKE ?","%#{params['body']['search']}%"])
    else
    @properties =Property.order('created_at ASC')
    end
  end
	
 def show
    @property = Property.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

  def new
    @property = Property.new
  end

def edit
  p 1111111111111111111111111111111
  p params
    @property = Property.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

def create
  p params 
  p 111111111111111111111111111
    @property = Property.new(params[:body][:property])
    if @property.save
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@property.errors)
    end
  end
	
	def update
    p params[:body][:property][:property_type]
    @property = Property.find(params[:body][:property][:id])
    if @property.update_attributes(:property_type=>params[:body][:property][:property_type])
      render :json=>{:response=>"success"}
    else
      p @property.errors
      render :json=>failure1(@property.errors)
    end
  end

def destroy
    @property = Property.find(params[:id])
    #~ @room=@property.rooms
    #~ if @property.present? && @room.present?
      #~ render :json=>{:response=>"Not deleted"}
    #~ else
      @property.destroy
       render :json=>{:response=>"success"}
    #~ end
  end
	
end
