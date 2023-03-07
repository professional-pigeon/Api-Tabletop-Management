class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create a user" do
    post users_path(email: 'yada@yada.com', user_name: 'test_kk', password: 'passable123')
    assert_response :success
  end
end