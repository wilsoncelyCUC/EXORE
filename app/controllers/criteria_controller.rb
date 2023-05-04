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
    @user = User.find(@criterium.user.id)
    @position = Position.find(@criterium.position_id)
    @social =  Social.find_by(user_id: @user.id).nil? ?  Social.new : Social.find_by(user_id: @user.id)

    @account = Account.find_by(user_id: @user.id)

    if !@social.nil?
      @user_stackoverflow =  @social.stack_overflow_url.empty? ? "Missing" : remove_base_url_StackOF(@social.stack_overflow_url)
      @user_github = @social.github_url.empty? ? "Missing" : remove_base_url_github(@social.github_url)
      @user_portfolio = @social.twitter_url.empty? ? "Missing" : "All good"
    end

    @capitalized_name = capitalize_name(@account.first_name, @account.last_name)

  end

  def edit
    find_account_current_user
  end

  def update
    find_account_current_user
    if @criterium.update(criterium_params)
      redirect_to criterium_path(@criterium)
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
    @criterium = Criterium.find(params[:id])
  end

  def find_account_current_user
    @account = Account.find_by(:user_id == current_user)
  end

  def criterium_params
    params.require(:criterium).permit(:search_status, :notice_period, :location, :salary_grid, :position_id, :remote_work_type)
  end

  def remove_base_url_StackOF(full_url)
    base_url = "https://stackoverflow.com/users/"
    user_url = full_url.sub(base_url, "")
    user_url
  end

  def remove_base_url_github(full_url)
    base_url = "https://github.com/"
    user_url = full_url.sub(base_url, "")
    user_url
  end

  def capitalize_name(first_name, last_name)
    capitalized_first_name = first_name.split.map(&:capitalize).join(' ')
    first_initial_last_name = last_name.split.first.capitalize.slice(0)
    "#{capitalized_first_name} #{first_initial_last_name}."
  end

end
