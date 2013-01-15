class ApplicationController < ActionController::Base
  around_filter :catch_exceptions
  respond_to :json, :xml
  
  #Returns success if the process is success
  def success
    {:response=>:success}
  end
  
  #Returns success if the process is faliure
  def failure
    {:response=>:failure}
  end
  
  #Return the process is errors
  def failure1(error=nil)
    {:header=>{:status=>400}, :errors=>error}
  end
  
  #Return the errors while payment process
  def failure2(error=nil,card=nil)
  {:header=>{:status=>400}, :errors=>error,:card=>card}
  end
  
  #To return success message
  def success1(body=nil)
    {:header=>{:status=>200}, :body=>body}
  end
  
  #To check if current user is authorized or not
  def authorized_user()
    if params.has_key?(:header)
      access_token=params[:header][:access_token]
    elsif
      access_token=params[:id]
    end
    @current_user = User.where(:authentication_token=>access_token).first unless access_token.nil?
    render :json=>{:header=>{:status=>400},:errors=>{:authentication_token=>{:code=>1005, :message=>"Authentication/Authorization Failed"}}} if @current_user.nil? && access_token != "signup"
  end
  
  #To find the current user access token valid or not
  def current_user()
    if params.has_key?(:header)
      access_token=params[:header][:access_token]
    elsif
      access_token=params[:id]
    end
    @current_user = User.where(:authentication_token=>access_token).first unless access_token.nil?
    render :json=>{:header=>{:status=>400},:errors=>{:authentication_token=>{:code=>1005, :message=>"Authentication/Authorization Failed"}}} if @current_user.nil? && access_token != "signup"
  end
  
  #To checking the current user access token is nil or not
  def authorize(access_token)
    @current_user=User.where(:authentication_token=>access_token).first unless access_token.nil?
    render :json=>{:header=>{:status=>400},:errors=>{:authentication_token=>{:code=>1005, :message=>"Authentication/Authorization Failed"}}} if @current_user.nil?
    return true;
  end
  
  #To rescue the exceptions
protected
    def catch_exceptions
      yield
      rescue => exception
      ExceptionNotifier::Notifier.default_sender_address == %("CareMonkey Notifier" <parthiban@railsfactory.org)
      ExceptionNotifier::Notifier.exception_notification(request.env,exception).deliver
      if exception.is_a?(ActiveRecord::RecordNotFound)
        render :template => 'errors/404',:layout=>false
      else
        render :template => 'errors/500',:layout=>false
      end
    end
  
end

