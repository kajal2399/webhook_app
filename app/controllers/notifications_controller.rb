class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      NotificationService.new.notify_third_parties(@notification)
      render json: @notification, status: :created
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  def update
    @notification = Notification.find(params[:id])
    if @notification.update(notification_params)
      NotificationService.new.notify_third_parties(@notification)
      render json: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:name, :data)
  end
end