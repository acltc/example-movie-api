require "test_helper"

class ActorsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/actors.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Actor.count, data.length
  end

  test "create" do
    assert_difference "Actor.count", 1 do
      post "/actors.json", params: { first_name: "Test", last_name: "Test", known_for: "Test" }
      assert_response 200
    end
  end
end
