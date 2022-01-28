class Book < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :released_year, presence: true
  validates :price, presence: true
  validates :category, presence: true
end
