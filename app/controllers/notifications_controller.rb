class NotificationsController < ApplicationController
  layout 'product'
  def index
    @notifications = Notification.all
  end
  
end