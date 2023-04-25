class PositionsController < ApplicationController

  before_action :find_position, only: [:show, :edit, :update, :destroy]

  def index
    @positions = Position.all
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)
    @position.user = current_user
    if @position.save!
      redirect_to root_path
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
    if @position.update(position_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @position.destroy
    redirect_to root_path
  end

  private

  def find_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.required(:position).permit(:position_name, :mr_salary)
  end

end
