# == Schema Information
#
# Table name: characters
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  character_type  :string           not null
#  character_race  :string           default("unknown")
#  description     :string           default("")
#  notes           :string           default("")
#  char_place_type :string
#  char_place_id   :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Character < ApplicationRecord
  belongs_to :char_place, polymorphic: true
end
