class Post < ApplicationRecord
  belongs_to :user
  has_many :books, dependent: :destroy

  validates :year, presence: true
  validates :month, presence: true
end
