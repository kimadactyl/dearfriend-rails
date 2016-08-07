require 'test_helper'

class LettersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @letter = create(:letter)
    @letter.authors << create(:author)
    @letter.recipients << create(:recipient)
  end

  test "should get index" do
    get letters_url
    assert_response :success
  end

  test "correct strings on index page" do
    # Test with one recipient
    get letters_url
    assert_select "h2.letters__title", "Dear Recipient Name, long recipient description."

    # Test with two recipients
    @letter.recipients << create(:second_recipient)
    get letters_url
    assert_select "h2.letters__title", "Dear Recipient Name, long recipient description and Second Recipient, second recipient description."

    # Test with three recipients
    @letter.recipients << create(:third_recipient)
    get letters_url
    assert_select "h2.letters__title", "Dear Recipient Name, long recipient description, Second Recipient, second recipient description, and Third Recipient, third recipient description."
  end

  test "should show letter" do
    get letter_url(@letter)
    assert_response :success
  end

  test "letter title and metadata should be correct" do
    # Test with one author
    get letter_url(@letter)
    assert_select "title", "A letter to Recipient Name, long recipient description. From Author Name | Dear Friend"
    assert_select "meta[content=?]", "A letter to Recipient Name, long recipient description. From Author Name | Dear Friend"
    assert_select "h1.page-title", "Dear Recipient Name, long recipient description. From Author Name"

    # Test with two authors
    @letter.authors << create(:second_author)
    get letter_url(@letter)
    assert_select "title", "A letter to Recipient Name, long recipient description. From Author Name and Second Author | Dear Friend"
    assert_select "meta[content=?]", "A letter to Recipient Name, long recipient description. From Author Name and Second Author | Dear Friend"
    assert_select "h1.page-title", "Dear Recipient Name, long recipient description. From Author Name and Second Author"

    # Test with three authors
    @letter.authors << create(:third_author)
    get letter_url(@letter)
    assert_select "title", "A letter to Recipient Name, long recipient description. From Author Name, Second Author, and Third Author | Dear Friend"
    assert_select "meta[content=?]", "A letter to Recipient Name, long recipient description. From Author Name, Second Author, and Third Author | Dear Friend"
    assert_select "h1.page-title", "Dear Recipient Name, long recipient description. From Author Name, Second Author, and Third Author"

    # Test with three authors and three recipients
    @letter.recipients << create(:second_recipient)
    @letter.recipients << create(:third_recipient)
    get letter_url(@letter)
    assert_select "title", "A letter to Recipient Name, long recipient description, Second Recipient, second recipient description, and Third Recipient, third recipient description. From Author Name, Second Author, and Third Author | Dear Friend"
    assert_select "meta[content=?]", "A letter to Recipient Name, long recipient description, Second Recipient, second recipient description, and Third Recipient, third recipient description. From Author Name, Second Author, and Third Author | Dear Friend"
    assert_select "h1.page-title", "Dear Recipient Name, long recipient description, Second Recipient, second recipient description, and Third Recipient, third recipient description. From Author Name, Second Author, and Third Author"

    # Should also have desriptions down the side
    assert_select "h2.recipient__name", 3
  end

end
