class CampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @token = JsonWebToken.encode(user_id: @user.id)
  end

  test "should get all of a users campaigns" do
    create(:campaign, name: 'Iago', user: @user)
    create(:campaign, user: @user)
    get "/user/campaigns/#{@user.id}", headers: { 'Authorization': @token}
    assert_response :success
    assert_equal parsed_response.count, 2
    assert_equal parsed_response.first['name'], 'Iago'
  end

  test "will return a single campaign with id" do
    campaign = create(:campaign, name: 'Iago 2', notes: 'test', user: @user)
    get "/campaigns/#{campaign.id}", headers: { 'Authorization': @token}
    assert_equal parsed_response['name'], 'Iago 2'
    assert_equal parsed_response['notes'], 'test'
  end

  test "will create a single campaign attached to user" do
    post "/campaigns", params: { name: 'Iago 2', notes: 'test', user_id: @user.id }, headers: { 'Authorization': @token}
    assert_equal parsed_response['name'], 'Iago 2'
    assert_equal parsed_response['notes'], 'test'
  end

  test "will update single campaign" do
    campaign = create(:campaign, name: 'Iago 2', notes: 'test', user: @user)
    patch "/campaigns/#{campaign.id}", params: { id: campaign.id, name: 'Iago 3' }, headers: { 'Authorization': @token }
    assert_equal parsed_response['name'], 'Iago 3'
    assert_equal parsed_response['notes'], 'test'
  end

  test "will destroy single campaign" do
    campaign = create(:campaign, user: @user)
    delete "/campaigns/#{campaign.id}", headers: { 'Authorization': @token }
    assert_response :success
    assert_equal Campaign.count, 0
  end
end