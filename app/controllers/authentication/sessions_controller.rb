class Authentication::SessionsController < ApplicationController
  skip_before_action :pages_protect

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    full_name = "#{@user&.name} #{@user&.last_name}"
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to products_path, notice: "Welcome #{full_name}"
    else
      redirect_to new_session_path, alert: "Invalid email or password"
    end
  end

end