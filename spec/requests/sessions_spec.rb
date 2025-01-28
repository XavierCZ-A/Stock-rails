require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  context "/Users" do
    it "should get new" do
      get new_session_path
      expect(response).to have_http_status(200)
    end

    it 'should login an user' do
      user = FactoryBot.create(:user, email: "test@example.com", password: "password123")

      post sessions_path, params: { email: user.email, password: user.password }

      expect(response).to redirect_to(products_path)
    end
  end
end