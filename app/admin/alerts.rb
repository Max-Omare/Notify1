ActiveAdmin.register Alert do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  permit_params :title, :body
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  controller do
    before_action :get_users

    def create
      @alert = Alert.new(alert_params)
      return unless @alert.save

      @users.each do |user|
        AlertMailer.with(alert: @alert).new_alert_email(user).deliver_later
      end

      redirect_to admin_alerts_path
    end

    def get_users
      @users = User.all
    end

    private

    def alert_params
      params.require(:alert).permit(:title, :body)
    end
  end
end
