require 'spec_helper'

describe SessionsController do
  let(:user) { FactoryGirl.create :user, password: 'test1234' }
  let(:params) { { user: { password: 'test1234', email: user.email } } }

  describe 'GET new' do
    it 'returns http success' do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    context 'when matching user is found' do
      it 'creates a new session with the user id' do
        post :create, params
        expect(session[:user_id]).to eql(user.id)
        expect(response).to redirect_to("/users/#{user.id}")
      end
    end

    context 'when no matching user is found' do
      before do
        params[:user][:email] = 'somerandomemail@someemail.com'
      end

      it 'doesn\'t create a new session key with the user_id' do
        post :create, params
        expect(session[:user_id]).to be_nil
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      session[:user_id] = user.id
    end

    it 'deletes the user_id from session' do
      delete :destroy, { id: user.id }
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to('/users/new')
    end
  end
end
