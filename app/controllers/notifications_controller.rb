class NotificationsController < ApplicationController

  def index
    @employee = current_user
    @notifications = Notification.all
  end

  def show
    @employee = Employee.find_by(paramas[:id])
    @notification = Notification.find_by(params[:id])
  end

  def new
    # @employee = Employee.find(params[:employee_id])
    @notification = Notification.new
  end

  def create
    @employee = current_user
    @notification = Notification.new(notification_params)
    @notification.employee = @employee
    if @notification.save
      redirect_to notification_path(@notification)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @notification = Notification.find_by(params[:id])
  end

  private

  def notification_params
    params.require(:notification).permit(:title, :body)
  end

end
