class ApplicationController < ActionController::Base
    #protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end   

    def forbid_login_user
      if current_user
        flash[:notice] = "すでにログインしています"
        redirect_to("/posts/index")
      end
    end  
end
