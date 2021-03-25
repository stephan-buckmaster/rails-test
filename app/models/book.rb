class Book < ApplicationRecord
  has_and_belongs_to_many :orders

  validates :name, presence: true
  validates :price, numericality: true
end
