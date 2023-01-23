# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user do
    user_name { Faker::Name.unique.name }
    email { Faker::Food.unique.fruits }
    password_digest { 'test123' }
  end
end
