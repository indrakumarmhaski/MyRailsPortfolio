class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :name])

end
