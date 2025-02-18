module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
    before_action :pages_protect

    private

    def set_current_user
      puts "Session user_id: #{session[:user_id]}"
      Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
      puts "Current user: #{Current.user.inspect}"
    end

    def pages_protect
      redirect_to new_session_path, alert: "You are not logged in" unless Current.user
    end
  end
end