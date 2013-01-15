class ContentsController < ApplicationController
 before_filter :current_user 
  
  #To showing the contents
  def index
    unless params['body']['search'].blank?
    @contents = Content.where(["name ILIKE ?","%#{params['body']['search']}%"])
    else
    @contents = Content.order('created_at DESC')
    end
  end

#To display the particular content
  def show
    @content = Content.find(params[:id])  
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

#To create new content
  def new
    @content = Content.new
  end

#To edit the existing content
  def edit
    @content = Content.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end
  
  #To create the new content
  def create
    @content = Content.new(params[:content])
    if @content.save
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@content.errors)
    end
  end
 
 #To update the edited record
  def update
    @content = Content.find_by_id(params[:id])
    if @content.update_attributes(:name=>params[:body][:name],:description=>params[:body][:description])
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@content.errors)
    end
  end

#To destroy the particular content
  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    if @content.present?
      @content.destroy
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@content.errors)
    end
 end
  
end