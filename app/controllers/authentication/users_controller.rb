class Authentication::UsersController < ApplicationController
  skip_before_action :pages_protect
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to products_path, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def user_params
    params.expect(user: [:name, :last_name, :email, :password])
  end
end