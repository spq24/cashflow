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

require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  it "should have a valid factory" do
  	expect(build(:sub_category)).to be_valid
  end

  it { should belong_to :user }
  it { should belong_to :category }
  it { should validate_presence_of :name }
  it { should validate_presence_of :category_id }
end
