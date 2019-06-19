class IncomesController < ApplicationController

  def index
    
  end

  def new
    @income = Income.new
    @income_categories = IncomeCategory.all 
    # @category = Category.find(params[:id])
    # binding.pry
    # @category_item = []
    # binding.pry
  end

  def create
    @income = Income.create(date: income_params[:date], Income_categories_id: income_params[:Income_categories_id], amount: income_params[:amount], user_id: current_user.id)
  end

  private
  def income_params
    params.require(:income).permit(:date, :Income_categories_id, :amount)
  end
  
end
