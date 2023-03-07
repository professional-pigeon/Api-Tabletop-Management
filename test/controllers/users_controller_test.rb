class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new(email: 'test@test.com', user_name: 'test_user')
    @user.password = 'yada123'
    @user.save
  end

  test "should create a user" do
    post users_path(email: 'test_kk@yada.com', user_name: 'test_kk', password: 'passable123')
    assert_response :success
  end

  test "should log in a user" do
    post auth_login_path(user_name: 'test_user', password: 'yada123')
    assert_response :success
    assert_not_nil parsed_response['token']
  end

  test "should reject a login with bad password" do
    post auth_login_path(user_name: 'test_user', password: 'ya123')
    assert_response 401
  end
end