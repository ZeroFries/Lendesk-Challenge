class CreateUserTest < ActiveSupport::TestCase
  test "call should return user when valid username and password" do
    response = CreateUser.call username: 'test', password: 'testTest2'

    assert_equal "test", response.user.username
  end

  test "call should return error when username blank" do
    response = CreateUser.call password: 'testTest2'

    assert_equal "Username required", response.error
  end

  test "call should return error when password blank" do
    response = CreateUser.call username: 'test'

    assert_equal "Password required", response.error
  end

  test "call should return error when username taken" do
    User.create! username: 'test', password: 'testTest2'
    response = CreateUser.call username: 'test', password: 'testTest2'

    assert_equal "Username already taken", response.error
  end

  test "call should return error when password not long enough" do
    response = CreateUser.call username: 'test', password: 'tesT2'

    assert_equal "Password must be 6 characters or more", response.error
  end

  test "call should return error when password does not contain an uppercase character" do
    response = CreateUser.call username: 'test', password: 'testtest2'

    assert_equal "Password must contain at least one uppercase character", response.error
  end

  test "call should return error when password does not contain a lowercase character" do
    response = CreateUser.call username: 'test', password: 'TESTEST2'

    assert_equal "Password must contain at least one lowercase character", response.error
  end

  test "call should return error when password does not contain a number" do
    response = CreateUser.call username: 'test', password: 'testest'

    assert_equal "Password must contain at least one digit", response.error
  end
end
