class ExpensesController < ApplicationController
  def create
    expense = current_user.expenses.create expense_params

    if expense.valid?
      flash.notice = 'Expense created successfully!'
    else
      flash.alert = 'Expense creation failed!'
    end

    redirect_to current_user
  end

  def update
    expense = current_user.expenses.find_by(id: params[:id])

    if expense && expense.update(expense_params)
      flash.notice = 'Expense updated successfully!'
    else
      flash.alert = 'Expense updation failed!'
    end

    redirect_to current_user
  end

  def destroy
    expense = current_user.expenses.find_by(id: params[:id])
    expense && expense.destroy && expense.destroyed?
    redirect_to current_user
  end

  private
    def expense_params
      params.require(:expense).permit(:price, :comment, :store)
    end
end
