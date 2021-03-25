require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  def test_shows_orders
    get '/'
    assert_select 'ul li', count: 3
    assert_select 'a[href="/"]', 'Home'
    assert_select 'a[href="/orders/new"]', 'Start your order'
    assert_select 'a[href="/orders"]', 'List of orders'
  end
end
