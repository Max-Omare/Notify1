class UsersController < ApplicationController
  # before_action :set_service, only: %i[destroy]
  # before_action :get_users

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return unless @user.save
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = user.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :reg_number, :phone, :school)
  end


end
