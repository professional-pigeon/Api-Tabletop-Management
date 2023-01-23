# == Schema Information
#
# Table name: sub_locations
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :string
#  notes       :string
#  location_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class SubLocationTest < ActiveSupport::TestCase
  test "create location" do
  end
end
