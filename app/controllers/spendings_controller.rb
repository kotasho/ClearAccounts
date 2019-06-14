class SpendingsController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @spending = Spending.new
  end

  def create
    @spending = Spending.create(date: spending_params[:date], category_id: spending_params[:category_id], amount: spending_params[:amount], user_id: current_user.id)
    # if @spending.save
    #   redirect_to 'spendings/new'
    # end
  end

  private
    def spending_params
      params.permit(:date, :category_id, :amount)
    end

end
