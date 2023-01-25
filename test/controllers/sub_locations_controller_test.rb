class SubLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = create(:location)
  end

  test "should get all of a locations sub_locations" do
    create(:sub_location, name: 'Toms shop', location: @location)
    create(:sub_location, location: @location)
    get sub_locations_path(location_id: @location.id)
    assert_response :success
    assert_equal parsed_response.count, 2
    assert_equal parsed_response.first['name'], 'Toms shop'
  end

  test "will return a single sub_location with id" do
    sub_location = create(:sub_location, name: 'Barrys shop', location: @location)
    get sub_location_path(id: sub_location.id)
    assert_equal parsed_response['name'], 'Barrys shop'
  end

  test "will create a single sub_location attached to location" do
    post sub_locations_path(name: 'Larrys shop', notes: 'sells armor', description: 'seedy', location_id: @location.id)
    assert_equal parsed_response['name'], 'Larrys shop'
  end

  test "will update single sub_location" do
    sub_location = create(:sub_location, name: 'A bar', notes: 'test', location: @location)
    patch sub_location_path(id: sub_location.id, name: 'An inn')
    assert_equal parsed_response['name'], 'An inn'
    assert_equal parsed_response['notes'], 'test'
  end

  test "will destroy single sub_location" do
    sub_location = create(:sub_location)
    delete sub_location_path(id: sub_location.id)
    assert_response :success
    assert_equal SubLocation.count, 0
  end
end