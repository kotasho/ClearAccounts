class AddIncomeCategoriesIdToIncomes < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :Income_categories_id, :string
  end
end
