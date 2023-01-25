# == Schema Information
#
# Table name: campaigns
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  notes      :string           default("")
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :campaign do
    user { create(:user) }
    name { 'test_campaign' }
    notes { 'These are the campaign notes' }
  end
end
