class SessionsController < Devise::SessionsController
  before_filter :authorized_user, :only=>[:destroy]

  # GET /resource/sign_in
  def new
    render :json =>{"response"=>"failure","error"=>flash[:alert]}
  end

  # POST /resource/sign_in
  def create
    p "helow the params in session controller api"
    puts params 
    user=params[:user]
    params[:user]={}
    params[:user][:login],params[:user][:password]=Base64.decode64(user).split(' ') #decodes the credentials as [email,password]
    @user=User.find_by_user_name(params[:user][:login])
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    resource.update_attribute(:authentication_token,SecureRandom.hex(10)) if resource.authentication_token.nil?
     unless params["remember_me"].blank?
    resource.update_attribute(:remember_created_at,Time.now)
    end
    role_id = resource.roles.first.id
      if  @user.is_rejected==false
    render :json=>find_user(resource,role_id)
    else
      render :json=>{"response"=>"user deleted"}
      end
  end

   def find_user(resource,role)
    {:user=>resource.serializable_hash(:only=>[:authentication_token,:user_name]),:role_id=>role}.merge({"response"=>"success"})
  end
  
  # DELETE /resource/sign_out
  def destroy
    resource=User.find_by_authentication_token(params[:header][:access_token])
    if resource.update_attribute(:authentication_token,nil)
      render :json=>{"response"=>"success"}
    else
      render :json=>resouce.errors
    end
  end

  protected

  def stub_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { :methods => methods, :only => [:password] }
  end
end

