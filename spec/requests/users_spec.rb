require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { FactoryBot.create(:user) }

  context "/Users" do
    it "should get new" do
      get new_user_path
      expect(response).to have_http_status(200)
    end

    it 'should create user' do
      # user_attributes = { email: "test@example.com", password_digest: "password" }
      post users_path, params: { user: FactoryBot.attributes_for(:user) }
      expect(response).to redirect_to(products_path)
    end
  end
end