class Income < ApplicationRecord
  # belongs_to :users
  has_many :income_categories
end
