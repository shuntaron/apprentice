require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  # GET /todos された場合、レスポンスとして HTTP ステータスコード200が返ってくる
  test "GET /todos returns HTTP status code 200" do
    get todos_url
    assert_response 200
  end
  
  # POST /todos された場合、リダイレクトされる
  # HTTP ステータスコード302が返ってくる でも可
  test "POST /todos redirects" do
    post todos_url, params: { todo: { title: "test" } }
    assert_response :redirect
    assert_response 302
  end
end
