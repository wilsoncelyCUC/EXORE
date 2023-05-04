class SocialsController < ApplicationController

  before_action :find_social, only: [:show, :edit, :update, :destroy]

  def index
    @socials = Social.all
  end

  def new
    @social = Social.new
  end

  def create
    @social = Social.new(social_params)
    @social.user = current_user
    if @social.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @social.update(social_params)
      redirect_to root_path
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

  def social_params
    params.required(:social).permit(:twitter_url, :github_url, :stack_overflow_url, :dribble_url)
  end


end
