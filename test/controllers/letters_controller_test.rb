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

  test "should show letter" do
    get letter_url(@letter)
    assert_response :success
  end

  test "letter title should be correct" do
    get letter_url(@letter)
    assert_select "title", "A letter to Recipient Name, long recipient description. From Author Name | Dear Friend"
    assert_select "meta[content=?]", "A letter to Recipient Name, long recipient description. From Author Name | Dear Friend"
    assert_select "h1.page-title", "To Recipient Name, long recipient description. From Author Name"
  end

end
