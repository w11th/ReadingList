require 'test_helper'

class CreatingBooksTestTest < ActionDispatch::IntegrationTest
  test 'creating new books' do
    post '/books', params: { book: { title: 'Pragmatic Programmer', rating: 5 } }.to_json,
                   headers: { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    book = json(response.body)
    assert_equal book_url(book[:id]), response.location

    assert_equal 'Pragmatic Programmer', book[:title]
    assert_equal 5, book[:rating].to_i
  end

  test 'does not create books with invalid data' do
    post '/books', params: { book: { title: nil, rating: 5 } }.to_json,
                   headers: { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert_equal 422, response.status
    assert_equal Mime[:json], response.content_type
  end
end
