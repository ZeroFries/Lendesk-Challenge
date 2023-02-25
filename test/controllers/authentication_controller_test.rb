class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create! username: 'test', password: BCrypt::Password.create('testTest2')
  end

  test "create should return 200 when valid username and password" do
    post authentication_url, params: { username: 'test', password: 'testTest2' }

    assert_response :success
  end

  test "create should return 401 when invalid username" do
    post authentication_url, params:  { username: 'invalid', password: 'testTest2' }

    assert_response 401
  end

  test "create should return 401 when invalid password" do
    post authentication_url, params:  { username: 'test', password: 'invalid' }

    assert_response 401
  end
end
