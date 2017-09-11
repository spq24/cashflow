# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  name        :string           default("")
#  description :text             default("")
#  category_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :sub_category do
    name "fuel"
    description "gas for the car"
    category
  end
end
