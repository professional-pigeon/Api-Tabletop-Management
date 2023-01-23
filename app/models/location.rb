# == Schema Information
#
# Table name: locations
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  type         :string           not null
#  description  :string
#  notes        :string
#  campaigns_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Location < ApplicationRecord
end
