class ApplicationController < ActionController::Base
 before_action :authenticate_user!
 before_action :configure_permitted_parameters, if: :devise_controller?
 protect_from_forgery with: :exception

 private
def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:account_name,:acc_id1,:email1])
 
end
end
