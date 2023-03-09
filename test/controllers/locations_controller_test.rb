class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    sign_in_as(@user)
    @campaign = create(:campaign, user: @user)
  end

  test "should get all of a campaigns locations" do
    create(:location, name: 'Chicago', campaign: @campaign)
    create(:location, campaign: @campaign)
    get locations_path(campaign_id: @campaign.id)
    assert_response :success
    assert_equal parsed_response.count, 2
    assert_equal parsed_response.first['name'], 'Chicago'
  end

  test "will return a single location with id" do
    location = create(:location, name: 'St Paul', campaign: @campaign)
    get location_path(id: location.id)
    assert_equal parsed_response['name'], 'St Paul'
  end

  test "will create a single location attached to campaign" do
    post locations_path(name: 'Chicago', location_type: 'city', notes: 'big place', description: 'midwestern', campaign_id: @campaign.id)
    assert_equal parsed_response['name'], 'Chicago'
  end

  test "will update single location" do
    location = create(:location, name: 'Chicago', notes: 'test', campaign: @campaign)
    patch location_path(id: location.id, name: 'St Paul')
    assert_equal parsed_response['name'], 'St Paul'
    assert_equal parsed_response['notes'], 'test'
  end

  test "will destroy single location" do
    location = create(:location)
    delete location_path(id: location.id)
    assert_response :success
    assert_equal Location.count, 0
  end
end