class CampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "should get a users campaigns" do
    create(:campaign, name: 'Iago', user: @user)
    create(:campaign, user: @user)
    get campaigns_path(user_id: @user.id)
    assert_response :success
    assert_equal parsed_response.count, 2
    assert_equal parsed_response.first['name'], 'Iago'
  end
end