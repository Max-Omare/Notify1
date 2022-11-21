class AlertsController < ApplicationController
  before_action :set_service, only: %i[destroy]
  before_action :get_users

  def index
    @alerts = Alert.all
  end

  def new
    @alert = Alert.new
  end

  def create
    @alert = Alert.new(alert_params)
    return unless @alert.save

    @users.each do |user|
      AlertMailer.with(alert: @alert).alert_posted_email(user).deliver_later
    end
  end

  def destroy
    @alert.destroy
  end

  def get_users
    @users = User.all
  end

  private

  def set_alert
    @alert = alert.find(params[:id])
  end

  def alert_params
    params.require(:alert).permit(:title, :body)
  end
end
