class CampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "should get a users campaigns" do
    create(:campaign, user: @user)
    get campaigns_path(user_id: @user.id)
    assert_response :success
  end
end