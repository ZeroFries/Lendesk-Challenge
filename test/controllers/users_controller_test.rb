class UsersControllerTest < ActionDispatch::IntegrationTest
  test "create should return 200 and user when valid username and password" do
    post users_url, params: { user: { username: 'test', password: 'testTest2' } }

    assert_response :success
    assert_equal "test", JSON.parse(@response.body)['user']['username']
  end

  test "create should return 500 when username taken" do
    User.create! username: 'test', password: 'testTest2'
    post users_url, params: { user: { username: 'test', password: 'testTest2' } }

    assert_response 500
    assert_equal "Username already taken", JSON.parse(@response.body)['error']
  end

  test "create should return 500 when password not secure" do
    post users_url, params: { user: { username: 'test', password: 'test' } }

    assert_response 500
    assert_equal "Password must be 6 characters or more", JSON.parse(@response.body)['error']
  end
end
