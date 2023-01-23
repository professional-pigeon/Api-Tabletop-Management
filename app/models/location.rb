# == Schema Information
#
# Table name: locations
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  type         :string           not null
#  description  :string
#  notes        :string
#  campaigns_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Location < ApplicationRecord
  belongs_to :campaigns
  has_many :sub_locations
  has_many :characters, as: :char_place
end
