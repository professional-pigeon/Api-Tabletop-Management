# == Schema Information
#
# Table name: characters
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  type            :string           not null
#  species         :string
#  description     :string
#  notes           :string
#  char_place_type :string
#  char_place_id   :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :character do
    name { 'tom' }
    character_type { 'npc' }
    species { 'aarakocra' }
    description { 'character description' }
    notes { 'These are the characters notes' }
  end
end
