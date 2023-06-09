class AccountsController < ApplicationController
  before_action :find_account, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    # Avoid account creation page if user uses Linkedin Auth
    if current_user.uid.nil? #without Linkedin Auth
      @account = Account.new
    else #with Linkedin Auth
      @account = Account.new(
        first_name: current_user.first_name,
        last_name: current_user.last_name,
        email: current_user.email,
        user_id: current_user.id,
        birthday: "2000/01/01",
        phone: "+33 6 00 00 00 00",
        sign_up: false
      )
      if @account.save!
        redirect_to new_criterium_path
      end
    end
  end

  def create
    @account = Account.new(account_params)
    @account.user = current_user
    if @account.save!
      redirect_to new_criterium_path
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
    if @account.update(account_params)
      redirect_to criterium_path(@criterium)
    else
      render :new
    end
  end

  def destroy
    @account.destroy
    redirect_to root_path
  end

  private

  def find_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:first_name, :last_name, :birthday, :phone, :email)
  end

  def find_criterium
    if @account.nil?
      @criterium = Criterium.find_by(user_id: current_user.id)
    else
      @criterium = Criterium.find_by(user_id: @account.user.id)
    end
  end

end
