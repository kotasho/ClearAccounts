class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.integer   :user_id
      t.date      :date
      t.integer   :category_id
      t.integer   :amount
      t.timestamps  
    end
  end
end
