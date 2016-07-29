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

end
