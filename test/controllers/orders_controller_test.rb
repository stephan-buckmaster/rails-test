require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_select 'form[action="/orders"][method="post"]' do
      assert_select 'input', count: 6
      assert_select 'input[name="order[book_ids][]"]', count: 4
      assert_select 'input[type="submit"]'
    end
    assert_response :success
  end

  test "should not create order without books" do
    assert_no_difference('Order.count') do
      post orders_url, params: { order: { customer: @order.customer } }
    end
    assert_response 422
  end

  test "should create order with books" do
    assert_difference('Order.count', 1) do
      post orders_url, params: { order: { customer: 'Test Customer',  book_ids: ["", "2"]}}
    end
    assert_redirected_to order_url(Order.last)
    assert_equal 'Test Customer', Order.last.customer
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
    assert_select 'h1', 'Order 1'
    assert_select 'h2', 'Books'
    assert_select 'ul li', 'Book 1 9.98'
    assert_select 'ul li', 'Book 3 15.7'
    assert_select 'a[href="/orders/1/edit"]','Edit'
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
