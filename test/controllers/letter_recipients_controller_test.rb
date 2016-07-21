require 'test_helper'

class LetterRecipientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @letter_recipient = letter_recipients(:one)
  end

  test "should get index" do
    get letter_recipients_url
    assert_response :success
  end

  test "should get new" do
    get new_letter_recipient_url
    assert_response :success
  end

  test "should create letter_recipient" do
    assert_difference('LetterRecipient.count') do
      post letter_recipients_url, params: { letter_recipient: { letter_id: @letter_recipient.letter_id, recipient_id: @letter_recipient.recipient_id } }
    end

    assert_redirected_to letter_recipient_url(LetterRecipient.last)
  end

  test "should show letter_recipient" do
    get letter_recipient_url(@letter_recipient)
    assert_response :success
  end

  test "should get edit" do
    get edit_letter_recipient_url(@letter_recipient)
    assert_response :success
  end

  test "should update letter_recipient" do
    patch letter_recipient_url(@letter_recipient), params: { letter_recipient: { letter_id: @letter_recipient.letter_id, recipient_id: @letter_recipient.recipient_id } }
    assert_redirected_to letter_recipient_url(@letter_recipient)
  end

  test "should destroy letter_recipient" do
    assert_difference('LetterRecipient.count', -1) do
      delete letter_recipient_url(@letter_recipient)
    end

    assert_redirected_to letter_recipients_url
  end
end
