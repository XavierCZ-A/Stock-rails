module AuthenticationHelpers
  def login_user
    @user = FactoryBot.create(:user)
    post sessions_path, params: { email: @user.email, password: 'SecretPassword' }
  end
end
