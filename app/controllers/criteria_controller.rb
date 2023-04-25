class CriteriaController < ApplicationController

  before_action :find_criterium, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @criterium = Criterium.new
  end

  def create
    @criterium = Criterium.new(criterium_params)
    @criterium.user = current_user
    if @criterium.save!
      redirect_to new_social_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    find_account_current_user
  end

  def update
    find_account_current_user
    if @criterium.update(criterium_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @criterium.destroy
    redirect_to root_path
  end

  private

  def find_criterium
    @criterium = criterium.find(params[:id])
  end

  def find_account_current_user
    @account = Account.find_by(:user_id == current_user)
  end

  def criterium_params
    params.require(:criterium).permit(:search_status, :notice_period, :location, :salary_grid, :position_id)
  end

end
