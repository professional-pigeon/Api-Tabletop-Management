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
FactoryBot.define do
  factory :location do
    campaign { build(:campaign) }
    name { 'test_location' }
    type { 'city' }
    description { 'Location description' }
    notes { 'These are the location notes' }
  end
end
