require 'spec_helper'

describe ExpensesController do
  let(:user) { FactoryGirl.create :user }
  let(:expense_params) do
    {
      expense: {
        price: 49.99,
        comment: 'Heart Rate Monitor',
        store: 'Amazon'
      }
    }
  end

  before do
    session[:user_id] = user.id
  end

  describe 'POST create' do
    let(:params) { expense_params }

    context 'with valid params' do
      it 'creates an expense' do
        expect{ post :create, params }.to change{ user.expenses.count }.to(1)
      end

      it 'redirects to the user profile page with a flash notice' do
        post :create, params
        expect(response).to redirect_to(user_path(user))
        expect(flash.notice).to eql('Expense created successfully!')
      end
    end

    context 'with invalid params' do
      before do
        params[:expense][:price] = "NOT_A_NUMBER"
      end

      it 'doesn\'t create an expense' do
        expect{ post :create, params }.not_to change{ user.expenses.count }
      end

      it 'redirects to the user profile page with a flash alert' do
        post :create, params
        expect(response).to redirect_to(user_path(user))
        expect(flash.alert).to eql('Expense creation failed!')
      end
    end
  end

  describe 'PATCH update' do
    let(:expense) { FactoryGirl.create :expense, user: user }
    let(:params) { expense_params.merge({ id: expense.id }) }

    context 'with valid params' do
      before do
        params[:expense][:store] = 'MT WORLD'
      end

      it 'updates the expense' do
        patch :update, params
        expect(expense.reload.store).to eql('MT WORLD')
      end

      it 'redirects to user profile with a flash notice' do
        patch :update, params
        expect(response).to redirect_to(user_path(user))
        expect(flash.notice).to eql('Expense updated successfully!')
      end
    end

    context 'with invalid params' do
      before do
        params[:expense][:price] = 'NOT_A_NUMBER'
      end

      it 'doesnt update any values' do
        price = expense.price
        patch :update, params
        expect(expense.reload.price).to eql(price)
      end

      it 'redirects to user profile with a flash alert' do
        patch :update, params
        expect(response).to redirect_to(user_path(user))
        expect(flash.alert).to eql('Expense updation failed!')
      end
    end
  end

  describe 'DELETE destroy' do
    let(:expense) { FactoryGirl.create :expense, user: user }

    it 'destroys the expense and redirects the user to profile page' do
      delete :destroy, { id: expense.id }
      expect(response).to redirect_to(user)
    end
  end
end
