# README

This is an app to test basic proficiency in Ruby on Rails.

The test consists in correcting the app code in order to get the tests
to pass, with zero failures and errors.

All required dependencies are documented in the Gemfile.  As it says,
this is for Ruby version 2.7 and Rails version 6. But the functionality
covered by the test is very basic, the versions hardly come in.

Tip: All fixes are one-liners. You might find that one failure is much
more difficult to fix than all the others.

# Sample run through:

    $ bundle install
    $ bundle exec rake db:test:prepare
    $ bundle exec rake 

# Test output

To be clear, this is before fixing tests.

    # Running:
    
    F
    
    Failure:
    OrderTest#test_calculates_total_0 [test/models/order_test.rb:17]:
    Expected: 0
      Actual: 1
    
    rails test test/models/order_test.rb:15
    
    .F
    
    Failure:
    OrderTest#test_calculates_total_2_books [test/models/order_test.rb:30]:
    Expected: 3.23
      Actual: 0.423e1
    
    rails test test/models/order_test.rb:26
    
    .F
    
    Failure:
    OrderTest#test_calculates_total_1_book [test/models/order_test.rb:23]:
    Expected: 1.23
      Actual: 0.223e1
    
    rails test test/models/order_test.rb:20
    
    .......F
    
    Failure:
    OrdersControllerTest#test_should_create_order_with_books [test/controllers/orders_controller_test.rb:31]:
    "Order.count" didn't change by 1.
    Expected: 3
      Actual: 2
    
    rails test test/controllers/orders_controller_test.rb:30
    
    .E
    
    Error:
    BooksControllerTest#test_should_create_book:
    NoMethodError: undefined method `sve' for #<Book:0x0000559499c557a0>
    Did you mean?  save
        app/controllers/books_controller.rb:27:in `block in create'
        app/controllers/books_controller.rb:26:in `create'
        test/controllers/books_controller_test.rb:24:in `block (2 levels) in <class:BooksControllerTest>'
        test/controllers/books_controller_test.rb:23:in `block in <class:BooksControllerTest>'
    
    rails test test/controllers/books_controller_test.rb:22
    
    ..E
    
    Error:
    BooksControllerTest#test_should_get_edit:
    ActionView::Template::Error: undefined method `rendertemplating' for #<ActionView::Base:0x00000000008520>
        app/views/books/edit.html.erb:3
        test/controllers/books_controller_test.rb:36:in `block in <class:BooksControllerTest>'
    
    rails test test/controllers/books_controller_test.rb:35
    
    F
    
    Failure:
    BooksControllerTest#test_should_reject_book_with_negative_price [test/controllers/books_controller_test.rb:48]:
    Expected response to be a <422: Unprocessable Entity>, but was a <302: Found> redirect to <http://www.example.com/books/1>
    Response body: <html><body>You are being <a href="http://www.example.com/books/1">redirected</a>.</body></html>.
    Expected: 422
      Actual: 302
    
    rails test test/controllers/books_controller_test.rb:46
    
    F
    
    Failure:
    BooksControllerTest#test_should_get_index [test/controllers/books_controller_test.rb:10]:
    <Book 1> expected but was
    <book.name>..
    Expected 0 to be >= 1.
    
    rails test test/controllers/books_controller_test.rb:8
    
    .F
    
    Failure:
    HomeControllerTest#test_shows_orders [test/controllers/home_controller_test.rb:7]:
    Expected at least 1 element matching "a[href="/"]", found 0..
    Expected 0 to be >= 1.
    
    rails test test/controllers/home_controller_test.rb:4
    
    .
    
    Finished in 0.903100s, 25.4678 runs/s, 43.1846 assertions/s.
    23 runs, 39 assertions, 7 failures, 2 errors, 0 skips
