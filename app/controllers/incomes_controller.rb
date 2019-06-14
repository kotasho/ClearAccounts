class IncomesController < ApplicationController

  def index
    
  end

  def new
    @income = Income.new
  end

  def create
    Income.create(date: income_params[:date], category: income_params[:category_id], amount: income_params[:amount])
  end

  
end
