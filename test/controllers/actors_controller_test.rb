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

  test "show" do
    get "/actors/#{Actor.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "first_name", "last_name", "known_for", "created_at", "updated_at"], data.keys
  end

  test "update" do
    actor = Actor.first
    patch "/actors/#{actor.id}.json", params: { first_name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["first_name"]
  end

  test "destroy" do
    assert_difference "Actor.count", -1 do
      delete "/actors/#{Actor.first.id}.json"
      assert_response 200
    end
  end
end
