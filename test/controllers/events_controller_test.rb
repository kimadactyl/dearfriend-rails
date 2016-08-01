require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = create(:event)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

end
