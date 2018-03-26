require 'rails_helper'

describe UsersController, type: :controller do
# let(:user) { User.create!(email: 'peter@example.com'), (password: '1234567890') }
@user = FactoryBot.create(:user)

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        it "loads the correct user details" do
          expect(response).to have_http_status(200)
          expect(assigns(:user)).to eq user
        end
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
