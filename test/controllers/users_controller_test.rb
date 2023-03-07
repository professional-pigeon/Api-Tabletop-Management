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
    post user_login_path(user_name: 'test_user', password: 'yada123')
    assert_response :success
  end
end