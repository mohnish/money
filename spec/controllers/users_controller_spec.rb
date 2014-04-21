require 'spec_helper'

describe UsersController do

  describe 'GET new' do
    it 'returns http success' do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    let(:params) do
      {
        user: {
          email: 'foo@bar.com',
          name: 'foo bar',
          password: 'test1234'
        }
      }
    end

    context 'when the user credentials are valid' do
      it 'creates an unverified user' do
        post :create, params
        user = User.last
        expect(user.email).to eql(params[:user][:email])
        expect(user.unverified?).to be(true)
        expect(response).to redirect_to('users/show')
      end
    end

    context 'when the user credentials are invalid' do
      before do
        FactoryGirl.create :user, email: params[:user][:email]
      end

      context 'when using an email that\'s already taken' do
        it 'returns a email is used error' do
          expect { post :create, params }.to change { User.count }.by(0)
          expect(response).not_to be_success
        end
      end
    end
  end

  describe 'GET edit' do
    let(:user) { FactoryGirl.create :user }

    it 'renders the edit template' do
      get :edit, { id: user.id }
      expect(response).to be_success
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH update' do
    let(:user) { FactoryGirl.create(:user) }
    let(:params) do
      {
        id: user.id,
        user: {
          name: 'foo bar'
        }
      }
    end

    context 'when provided details are valid' do
      it 'updates the user record' do
        patch :update, params
        expect(response).to be_success
        expect(assigns(:user).errors).to be_empty
        expect(user.reload.name).to eql('foo bar')
      end
    end

    context 'when provided details are invalid' do
      before do
        existing_user = FactoryGirl.create :user
        params[:user] = { email: existing_user.email }
      end

      it 'returns errors to the template' do
        patch :update, params
        expect(response).not_to be_success
        expect(assigns(:user).errors).not_to be_empty
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:user) { FactoryGirl.create :user }

    it 'returns http success' do
      expect { delete :destroy, { id: user.id } }.to change { User.count }.from(1).to(0)
      expect(response).to be_success
    end
  end

  describe 'POST verify' do
    let(:user) { FactoryGirl.create :user }
    let(:params) { { verification_id: 'verifid' } }

    it 'verifies the entered email address' do
      pending
      post :verify, params
      expect(response).to be_success
    end
  end

end
