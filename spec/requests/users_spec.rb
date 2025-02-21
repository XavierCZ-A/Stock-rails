require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { FactoryBot.create(:user) }

  context "/Users" do
    it "should get new" do
      get new_user_path
      expect(response).to have_http_status(200)
    end

    it 'should create user' do
      post users_path, params: { user: FactoryBot.attributes_for(:user) }
      expect(response).to redirect_to(products_path)
    end
  end
end