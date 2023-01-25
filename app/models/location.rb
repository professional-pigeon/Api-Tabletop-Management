# == Schema Information
#
# Table name: locations
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  location_type :string           not null
#  description   :string           default("")
#  notes         :string           default("")
#  campaign_id   :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Location < ApplicationRecord
  belongs_to :campaign
  has_many :sub_locations
  has_many :characters, as: :char_place
end
