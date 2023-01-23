# == Schema Information
#
# Table name: campaigns
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  notes      :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CampaignTest < ActiveSupport::TestCase
  test "create campaign" do
    count = Campaign.count
    @campaign = create(:campaign)
    assert_equal (count + 1), Campaign.count
  end
end
