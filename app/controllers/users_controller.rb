class UsersController < ApplicationController

  def index
    @name = current_user.name
  end

  def show
    # @spending_chart = [["Football", 10], ["Basketball", 5]]
    # @income_chart = [["Football", 10], ["Basketball", 5]]
    

    @search_year = params[:year]
    @search_month = params[:month]
    detail_year =  @search_year
    detail_month = @search_month

    
    #収入計算
    @income_detail_saraly = Income.group("YEAR(date)").group("MONTH(date)").where(income_categories_id: 1).sum(:amount)
    @income_detail_saraly[[@search_year.to_i, @search_month.to_i]]
    @income_detail_saraly_view = @income_detail_saraly[[@search_year.to_i, @search_month.to_i]]
   
    @income_detail_bonus = Income.group("YEAR(date)").group("MONTH(date)").where(income_categories_id: 2).sum(:amount)
    @income_detail_bonus[[@search_year.to_i, @search_month.to_i]]
    @income_detail_bonus_view = @income_detail_bonus[[@search_year.to_i, @search_month.to_i]]
    
    @income_detail_investment = Income.group("YEAR(date)").group("MONTH(date)").where(income_categories_id: 3).sum(:amount)
    @income_detail_investment[[@search_year.to_i, @search_month.to_i]]
    @income_detail_investment_view = @income_detail_investment[[@search_year.to_i, @search_month.to_i]]
    
    @income_detail_sub = Income.group("YEAR(date)").group("MONTH(date)").where(income_categories_id: 4).sum(:amount)
    @income_detail_sub[[@search_year.to_i, @search_month.to_i]]
    @income_detail_sub_view = @income_detail_sub[[@search_year.to_i, @search_month.to_i]]
   
    @income_detail_total = Income.group("YEAR(date)").group("MONTH(date)").sum(:amount)
    @income_detail_total[[@search_year.to_i, @search_month.to_i]]
    @income_detail_total_view = @income_detail_total[[@search_year.to_i, @search_month.to_i]]
    
    @income_chart = ["給与", @income_detail_total_view], ["賞与", @income_detail_bonus_view],["投資", @income_detail_investment_view],["副業", @income_detail_sub_view]
    
     
    # binding.pry
   

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
