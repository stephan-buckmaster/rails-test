require "test_helper"

class BookTest < ActiveSupport::TestCase
  def test_requires_name
    b = Book.new
    assert !b.valid?
    assert_equal ["can't be blank"], b.errors[:name]
  end

  def test_requires_numerical_price
    b = Book.new(price: 'nogood')
    assert !b.valid?
    assert_equal ["is not a number"], b.errors[:price]
  end
end
