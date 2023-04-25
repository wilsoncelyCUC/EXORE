class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  def after_sign_in_path_for(resource)
    if Account.find_by(user_id: current_user.id).nil?
      new_account_path
    else
      root_path
    end
  end


end
