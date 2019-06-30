class BooksController < ApplicationController

def index
  @name = current_user.name
  # 今月は何月か
  time = Time.now
  this_month = time.month
  this_year = time.year
  @this_month =  this_month
  @this_year = this_year
  
  # 設定した予算の今月
  @income_budget = Budget.find_by(year: this_year, month: this_month, user_id: current_user.id).income_amount
  @spending_budget = Budget.find_by(year: this_year, month: this_month, user_id: current_user.id).spending_amount
  
  # 今月の現在の収支状況

  @current_income = Income.group("YEAR(date)").group("MONTH(date)").where(user_id: current_user.id).sum(:amount)
  @current_income[[this_year,this_month]]
  @current_income_view = @current_income[[this_year,this_month]]
  
  @current_spending = Spending.group("YEAR(date)").group("MONTH(date)").where(user_id: current_user.id).sum(:amount)
  @current_spending[[this_year,this_month]]
  @current_spending_view = @current_spending[[this_year,this_month]]

  # binding.pry
end

def new
end

def show
  time = Time.now
  @today = Income
  # @income = Budget.find(params[:id])
  
  # binding.pry
end

def edit
  @search_year = params[:year]
  @search_month = params[:month]
  @search_day = params[:day]

  # binding.pry
end

end
