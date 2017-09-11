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

class Category < ApplicationRecord
	has_many :sub_categories
	belongs_to :user

	validates :name, presence: true
end
