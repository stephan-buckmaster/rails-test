class Order < ApplicationRecord
  has_and_belongs_to_many :books
  validates :books, presence: true
  validates :customer, presence: true

  def total_price
    books.inject(1) { |total, b| total + b.price}
  end
end
