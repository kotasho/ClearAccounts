class UsersController < ApplicationController

  def index
    @name = current_user.name
  end

  def show
    
    @search_year = params[:year]
    @search_month = params[:month]
    detail_year =  @search_year
    detail_month = @search_month

    # 以下問題ありコード。修正を検討する
    # 長すぎる
    # カテゴリーIDを１つずつ取ってきているため、もしユーザーが独自にカテゴリーを追加できる機能をつける場合、対応できない
    
    #収入計算
    @income_detail_saraly = Income.group("YEAR(date)").group("MONTH(date)").where(income_categories_id: 1, user_id: current_user.id).sum(:amount)
    @income_detail_saraly[[@search_year.to_i, @search_month.to_i]]
    @income_detail_saraly_view = @income_detail_saraly[[@search_year.to_i, @search_month.to_i]]
   
    @income_detail_bonus = Income.group("YEAR(date)").group("MONTH(date)").where(income_categories_id: 2, user_id: current_user.id).sum(:amount)
    @income_detail_bonus[[@search_year.to_i, @search_month.to_i]]
    @income_detail_bonus_view = @income_detail_bonus[[@search_year.to_i, @search_month.to_i]]
    
    @income_detail_investment = Income.group("YEAR(date)").group("MONTH(date)").where(income_categories_id: 3, user_id: current_user.id).sum(:amount)
    @income_detail_investment[[@search_year.to_i, @search_month.to_i]]
    @income_detail_investment_view = @income_detail_investment[[@search_year.to_i, @search_month.to_i]]
    
    @income_detail_sub = Income.group("YEAR(date)").group("MONTH(date)").where(income_categories_id: 4, user_id: current_user.id).sum(:amount)
    @income_detail_sub[[@search_year.to_i, @search_month.to_i]]
    @income_detail_sub_view = @income_detail_sub[[@search_year.to_i, @search_month.to_i]]
   
    @income_detail_total = Income.group("YEAR(date)").group("MONTH(date)").where(user_id: current_user.id).sum(:amount)
    @income_detail_total[[@search_year.to_i, @search_month.to_i]]
    @income_detail_total_view = @income_detail_total[[@search_year.to_i, @search_month.to_i]]
    
    @income_chart = ["給与", @income_detail_saraly_view], ["賞与", @income_detail_bonus_view],["投資", @income_detail_investment_view],["副業", @income_detail_sub_view]
    
    
    # 支出計算
    @spending_detail_home = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 1, user_id: current_user.id).sum(:amount)
    @spending_detail_home[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_home_view = @spending_detail_home[[@search_year.to_i, @search_month.to_i]]
    
    @spending_detail_utility = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 2, user_id: current_user.id).sum(:amount)
    @spending_detail_utility[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_utility_view = @spending_detail_utility[[@search_year.to_i, @search_month.to_i]]
    
    @spending_detail_food = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 3, user_id: current_user.id).sum(:amount)
    @spending_detail_food[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_food_view = @spending_detail_food[[@search_year.to_i, @search_month.to_i]]

    @spending_detail_trafic = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 4, user_id: current_user.id).sum(:amount)
    @spending_detail_trafic[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_trafic_view = @spending_detail_trafic[[@search_year.to_i, @search_month.to_i]]

    @spending_detail_cloth = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 5, user_id: current_user.id).sum(:amount)
    @spending_detail_cloth[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_cloth_view = @spending_detail_cloth[[@search_year.to_i, @search_month.to_i]]

    @spending_detail_daily = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 6, user_id: current_user.id).sum(:amount)
    @spending_detail_daily[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_daily_view = @spending_detail_daily[[@search_year.to_i, @search_month.to_i]]

    @spending_detail_education = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 7, user_id: current_user.id).sum(:amount)
    @spending_detail_education[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_education_view = @spending_detail_education[[@search_year.to_i, @search_month.to_i]]
    
    @spending_detail_leisure = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 8, user_id: current_user.id).sum(:amount)
    @spending_detail_leisure[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_leisure_view = @spending_detail_leisure[[@search_year.to_i, @search_month.to_i]]
    
    @spending_detail_insurence = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 9, user_id: current_user.id).sum(:amount)
    @spending_detail_insurence[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_insurence_view = @spending_detail_insurence[[@search_year.to_i, @search_month.to_i]]
    
    @spending_detail_device = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 10, user_id: current_user.id).sum(:amount)
    @spending_detail_device[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_device_view = @spending_detail_device[[@search_year.to_i, @search_month.to_i]]
    
    @spending_detail_investment = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 11, user_id: current_user.id).sum(:amount)
    @spending_detail_investment[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_investment_view = @spending_detail_investment[[@search_year.to_i, @search_month.to_i]]
    
    @spending_detail_books = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 12, user_id: current_user.id).sum(:amount)
    @spending_detail_books[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_books_view = @spending_detail_books[[@search_year.to_i, @search_month.to_i]]

    @spending_detail_beauty = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 13, user_id: current_user.id).sum(:amount)
    @spending_detail_beauty[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_beauty_view = @spending_detail_beauty[[@search_year.to_i, @search_month.to_i]]

    @spending_detail_sports = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 14, user_id: current_user.id).sum(:amount)
    @spending_detail_sports[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_sports_view = @spending_detail_sports[[@search_year.to_i, @search_month.to_i]]

    @spending_detail_read = Spending.group("YEAR(date)").group("MONTH(date)").where(category_id: 15, user_id: current_user.id).sum(:amount)
    @spending_detail_read[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_read_view = @spending_detail_read[[@search_year.to_i, @search_month.to_i]]
    # binding.pry

    @spending_detail_total = Spending.group("YEAR(date)").group("MONTH(date)").where(user_id: current_user.id).sum(:amount)
    @spending_detail_total[[@search_year.to_i, @search_month.to_i]]
    @spending_detail_total_view = @spending_detail_total[[@search_year.to_i, @search_month.to_i]]
   
    @spending_chart = ["家賃", @spending_detail_home_view],["水道光熱費", @spending_detail_utility_view],["食費", @spending_detail_food_view],["交通費", @spending_detail_trafic_view],["衣類", @spending_detail_trafic_view],
    ["日用品", @spending_detail_daily_view],["教育費", @spending_detail_education_view],["レジャー", @spending_detail_leisure_view],["保険", @spending_detail_insurence_view],["通信費", @spending_detail_device_view],
    ["投資", @spending_detail_investment_view],["書籍", @spending_detail_books_view],["美容", @spending_detail_beauty_view],["スポーツ", @spending_detail_sports_view],["定期購読", @spending_detail_read_view]

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
