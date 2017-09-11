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

class SubCategory < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :name, presence: true
end
