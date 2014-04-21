require 'spec_helper'

describe ApplicationController do
  context '#current_user' do
    let(:user) { FactoryGirl.create :user }

    before do
      session[:user_id] = user.id
    end

    it 'returns the current user set in the session' do
      expect(controller.send(:current_user)).to eql(user)
    end
  end
end
