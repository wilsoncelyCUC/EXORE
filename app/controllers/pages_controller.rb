class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :debug]

  def debug
    render json: {
      #client_id: Rails.application.credentials.linkedin[:client_id],
      #client_secret: Rails.application.credentials.linkedin[:client_secret]
    }
  end

  def home
  end
end
