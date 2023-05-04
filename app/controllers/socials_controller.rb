class SocialsController < ApplicationController

  before_action :find_social, only: [:show, :edit, :update, :destroy]

  def index
    @socials = Social.all
  end

  def new
    @social = Social.new
  end

  def create
    find_criterium
    @social = Social.new(social_params)
    @social.user = current_user
    if @social.save!
      redirect_to criterium_path(@criterium)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    find_criterium
    find_account
    if @social.update(social_params)
      @account.sign_up = true
      @account.save
      @social.save
      redirect_to criterium_path(@criterium)
    else
      render :new
    end
  end

  def destroy
    @social.destroy
    redirect_to root_path
  end

  private

  def find_social
    @social = Social.find(params[:id])
  end

  def find_account
    @account = Account.find_by(user_id: @social.user.id)
  end

  def social_params
    params.required(:social).permit(:twitter_url, :github_url, :stack_overflow_url, :dribble_url)
  end

  def find_criterium
    if @social.nil?
      @criterium = Criterium.find_by(user_id: current_user.id)
    else
      @criterium = Criterium.find_by(user_id: @social.user.id)
    end
  end

end
