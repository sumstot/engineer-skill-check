class NotificationsController < ApplicationController

  def index
    @notifications = Notification.all
  end

  def show
    @employee = Employee.find_by(paramas[:id])
    @notification = Notification.find_by(params[:id])
  end
end
