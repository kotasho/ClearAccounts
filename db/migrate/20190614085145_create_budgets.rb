class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.integer   :user_id
      t.integer   :year
      t.integer   :month
      t.integer   :income_amount
      t.integer   :spending_amount
      t.timestamps
    end
  end
end
