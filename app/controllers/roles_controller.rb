class RolesController < ApplicationController

  before_filter :authorized_user,:except=>:role_name

  def index
      @roles = Role.order('created_at ASC')
  end

  
  def show
    @role = Role.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

  
  def new
    @role = Role.new
  end

  
  def edit
    @role = Role.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

 
  def create
    @role = Role.new(params[:role])
    if @role.save
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@role.errors)
    end
  end

  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(:name=>params[:body][:name])
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@role.errors)
    end
  end

  
  def destroy
    @role = Role.find(params[:id])
    if @role.present?
      @role.destroy
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(:record=>"Record not found")
      end
  end
  
  def search
    @role = Role.where(["name LIKE ?","%#{params[:body][:search]}%"])
  end
  
  def search_with_user_name
    @user = User.find_by_user_name(params['body']['user_name']).roles.first.name if params['body']['user_name']
    render:json=>{:response=>@user}
  end
  
  def role_name
@roles=Role.order('created_at desc').limit(2)
render:json=>{:response=>@roles}
end
  
end
