class NotificationsController < ApplicationController

  def index
    @notifications = Notification.all
  end

  def show
    @employee = Employee.find_by(paramas[:id])
    @notification = Notification.find_by(params[:id])
  end

  def new
    @notification = Notification.new
  end

  private

  def notification_params
    params.require(:notification).permit(:title, :body)
  end

end
