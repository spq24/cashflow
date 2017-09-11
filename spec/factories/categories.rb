# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string           default("")
#  description :text             default("")
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :category do
    name "transportation"
    description "chase freedom card"
  end
end
