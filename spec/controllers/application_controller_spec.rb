require 'spec_helper'

describe ApplicationController do
  describe '#current_user' do
    let(:user) { FactoryGirl.create :user }

    before do
      session[:user_id] = user.id
    end

    it 'returns the current user set in the session' do
      expect(controller.send(:current_user)).to eql(user)
    end
  end

  describe '#logged_in?' do
    before do
      controller.stubs(:current_user).returns(build(:user))
    end

    it 'returns true when logged in' do
      expect(controller.send(:logged_in?)).to be(true)
    end
  end
end
