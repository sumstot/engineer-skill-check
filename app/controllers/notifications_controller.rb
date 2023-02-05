class NotificationsController < ApplicationController
  # before_action :set_notification, only: %i(show edit update destroy)

  def index
    @employee = current_user
    @notifications = Notification.all
  end

  def show
    @notification = Notification.find(params[:id])
  end

  def new
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

  def edit
    @notification = Notification.find(params[:id])
  end

  def update
    @notification = Notification.find(params[:id])
    if @notification.update(notification_params)
      redirect_to notification_path(@notification), notice: "お知らせ「#{@notification.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to notifications_path, notice: "お知らせ#{@notification.title} を削除しました。"
  end

  private

  # def set_notification
  #   @notifiaction = Notification.find(params[:id])
  # end

  def notification_params
    params.require(:notification).permit(:title, :body)
  end
end
