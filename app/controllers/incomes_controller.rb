class IncomesController < ApplicationController

  def index
    
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.create(date: income_params[:date], category_id: income_params[:category_id], amount: income_params[:amount], user_id: current_user.id)
  end

  private
  def income_params
    params.permit(:date, :category_id, :amount)
  end
  
end
