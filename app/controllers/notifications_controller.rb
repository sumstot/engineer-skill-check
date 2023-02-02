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
    @user = current_user
    @notification = Notification.new(notification_params)
    @notification.employee_id = @user.id
    if @notification.save
      redirect_to notifications_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:title, :body)
  end

end
