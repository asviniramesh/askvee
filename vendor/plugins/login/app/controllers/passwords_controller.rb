
class PasswordsController < ApplicationController
	prepend_before_filter :require_no_authentication
  include Devise::Controllers::InternalHelpers

  # GET /resource/password/new
  def new
    build_resource({})
    render_with_scope :new
  end

  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])

    if successfully_sent?(resource)
      render :json=>{"response"=>"success"}
    else
      render :json=>failure1(self.resource.errors)
    end    
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    self.resource = resource_class.new
    resource.reset_password_token = params[:reset_password_token]
    render_with_scope :edit
  end

  # PUT /resource/password
  def update
    @resource=User.find_by_reset_password_token(params[:user][:reset_password_token])
    #~ self.resource = resource_class.reset_password_by_token(params[resource_name])
    @resource.update_attributes(:password=>params[:user][:password],:password_confirmation=>params[:user][:password_confirmation],:step=>"2")
    if @resource.errors.empty?
      @resource.update_attribute(:reset_password_token,nil)
      render :json=>{"response"=>"success"}
    else
      render :json=>failure1(@resource.errors)
    end
  end

  protected

    # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
      new_session_path(resource_name)
    end
end

