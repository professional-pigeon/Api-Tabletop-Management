# == Schema Information
#
# Table name: sub_locations
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :string           default("")
#  notes       :string           default("")
#  location_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :sub_location do
    location { create(:location) }
    name { 'test_sub_location' }
    description { 'Sub Location description' }
    notes { 'These are the sub location notes' }
  end
end
