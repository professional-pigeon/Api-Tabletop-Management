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
require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  test "create character attached to location" do
    location = create(:location)
    character = create(:character, char_place: location)
    puts Location.count
    assert_equal location.characters.first.id, character.id
  end
end
