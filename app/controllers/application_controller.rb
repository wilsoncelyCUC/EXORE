class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :find_criterium_app
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :picture_url, :provider, :uid])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :picture_url, :provider, :uid])
  end

  def after_sign_in_path_for(resource)
      if Account.find_by(user_id: current_user.id).nil?
          new_account_path
      else
        root_path
      end

  end

  def find_criterium_app
    @user_criterium = Criterium.find_by(user_id: current_user.id)
  end

end
