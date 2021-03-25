require "test_helper"

class OrderTest < ActiveSupport::TestCase
  def test_requires_customer
    o = Order.new
    assert !o.valid?
    assert_equal ["can't be blank"], o.errors[:customer]
  end
  def test_requires_at_least_one_book
    o = Order.new
    assert !o.valid?
    assert_equal ["can't be blank"], o.errors[:books]
  end

  def test_calculates_total_0
    o = Order.new
    assert_equal 0, o.total_price
  end

  def test_calculates_total_1_book
    o = Order.new
    o.books << Book.create(name: 'abc', price: 1.23)
    assert_equal 1.23, o.total_price
  end

  def test_calculates_total_2_books
    o = Order.new
    o.books << Book.create(name: 'abc', price: 1.23)
    o.books << Book.create(name: 'def', price: 2.00)
    assert_equal 3.23, o.total_price
  end
end
