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
class SubLocation < ApplicationRecord
  belongs_to :location
  has_many :characters, as: :char_place
end
