require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @events = [ create(:event), create(:past_event) ]
  end

  test "should get index" do
    get events_url
    assert_response :success
    # Should show the current event, and not show the past event
    assert_select "article.event", 1
  end

end
