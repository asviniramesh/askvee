class StatesController < ApplicationController
  before_filter :authorized_user, :except=>[:new]

  def new
    @states=Country.find_by_id(params[:body][:id]).states.select("id, name")
    render :json=>success1(:states=>@states)
  end
  
  def index
    p params['body']['search_text']
    unless params['body']['search_text']
      @states = State.where(["name ILIKE ?","%#{params['body']['search']}%"])
    else
    @states =State.order('created_at ASC')
    end
  end

  def show
    @state = State.find(params[:id])
    @country =@state.country
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

  def edit
    @state = State.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    render :json=>{:response=>"The record can't be found"}
  end

  def create
    @state = State.new(params[:state])
    country = Country.find_by_id(params[:state][:country_id]) if params[:state][:country_id]
    @state.country = country
    if @state.save
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@state.errors)
    end
  end

  def update
    @state = State.find(params[:id])
    if @state.update_attributes(:name=>params[:body][:name]) 
      render :json=>{:response=>"success"}
    else
      render :json=>failure1(@state.errors)
    end
  end

  def destroy
    @state = State.find(params[:id])
    @user = @state.user
    if @state.present? && @user.present?
      render :json=>{:response=>"Not deleted"}
    else
      @state.destroy
      render :json=>{:response=>"success"}
    end
  end
  
end
