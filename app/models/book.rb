class Book < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :inout, presence: true
  validates :amount, presence: true
  validates :category, presence: true
end
