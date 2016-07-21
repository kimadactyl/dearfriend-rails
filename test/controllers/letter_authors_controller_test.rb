require 'test_helper'

class LetterAuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @letter_author = letter_authors(:one)
  end

  test "should get index" do
    get letter_authors_url
    assert_response :success
  end

  test "should get new" do
    get new_letter_author_url
    assert_response :success
  end

  test "should create letter_author" do
    assert_difference('LetterAuthor.count') do
      post letter_authors_url, params: { letter_author: { author_id: @letter_author.author_id, letter_id: @letter_author.letter_id } }
    end

    assert_redirected_to letter_author_url(LetterAuthor.last)
  end

  test "should show letter_author" do
    get letter_author_url(@letter_author)
    assert_response :success
  end

  test "should get edit" do
    get edit_letter_author_url(@letter_author)
    assert_response :success
  end

  test "should update letter_author" do
    patch letter_author_url(@letter_author), params: { letter_author: { author_id: @letter_author.author_id, letter_id: @letter_author.letter_id } }
    assert_redirected_to letter_author_url(@letter_author)
  end

  test "should destroy letter_author" do
    assert_difference('LetterAuthor.count', -1) do
      delete letter_author_url(@letter_author)
    end

    assert_redirected_to letter_authors_url
  end
end
