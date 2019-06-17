class UsersController < ApplicationController

  def show
    # @spending_chart = Spending.find(user_id: current_user.id)
    # @income_chart = Income.find(user_id: current_user.id)
    @spending_chart = [["Football", 10], ["Basketball", 5]]
    @income_chart = [["Football", 10], ["Basketball", 5]]
    @name = current_user.name
    # @spending_amount = Spending.find(params[:id])
    # @income_amount = Income.find(params[:id])
  end

  def new
    @budget = Budget.new
    # @income_amount = @budget.income_amount
    # @spending_amount = @budget.spending_amount
  end

  def create
    @budget = Budget.create(year: budget_params[:year],month: budget_params[:month], income_amount: budget_params[:income_amount], spending_amount: budget_params[:spending_amount], user_id: current_user.id)
  end

  def edit
  end

  private
    def budget_params
      params.permit(:year, :month, :income_amount, :spending_amount)
    end

end
