# == Schema Information
#
# Table name: locations
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  type        :string           not null
#  description :string
#  notes       :string
#  campaign_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class LocationTest < ActiveSupport::TestCase
  test "create location" do
    count = Location.count
    @location = create(:location)
    assert_equal (count + 1), Location.count
  end
end
