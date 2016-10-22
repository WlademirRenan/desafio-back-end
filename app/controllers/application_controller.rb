class ApplicationController < ActionController::Base
  layout 'admin_lte_2'

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  #def configure_permitted_parameters 
  #  devise_parameter_sanitizer.for(:sign_up) << :name
  #  devise_parameter_sanitizer.for(:account_update) << :name
  #end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
