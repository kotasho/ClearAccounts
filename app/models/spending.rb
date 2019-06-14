class Spending < ApplicationRecord
  # belongs_to :users
  has_many :categories
end
