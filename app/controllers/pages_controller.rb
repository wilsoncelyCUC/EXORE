class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :home ]

  def home
    find_account
  end

  private

  def find_account
    byebug
    @account = Account.find_by(:user_id == current_user)
  end
end
