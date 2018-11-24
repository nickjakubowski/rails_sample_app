require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #new' do
    context 'new user creation' do
      it 'errors if user info is invalid' do
        post :create, params: { user: { name:  '',
                                        email: 'user@invalid',
                                        password:              'foo',
                                        password_confirmation: 'bar' } }
        expect(response).to have_http_status(:error)
      end
    end
  end

end
