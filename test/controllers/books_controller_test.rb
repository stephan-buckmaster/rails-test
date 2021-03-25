require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_select 'tbody tr td', 'Book 1'
    assert_select 'tbody tr td', 'Book 2'
    assert_select 'tbody tr td', 'Book 3'
    assert_select 'a[href="/books/new"]', 'New Book'
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { name: @book.name, price: @book.price } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { name: @book.name, price:  123 } }
    assert_redirected_to book_url(@book)
    assert_equal 123, @book.reload.price
  end

  test "should reject book with negative price" do
    patch book_url(@book), params: { book: { name: @book.name, price: -123 } }
    assert_response 422
    assert_select 'div#error_explanation' do
      assert_select 'h2', '1 error prohibited this book from being saved:'
      assert_select 'ul li', 'Price must be greater than 0'
    end
    assert_equal 9.98, @book.reload.price
  end


  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
