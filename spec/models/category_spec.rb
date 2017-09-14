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

require 'rails_helper'

RSpec.describe Category, type: :model do
  it "should have a valid factory" do
  	expect(build(:category)).to be_valid
  end

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :sub_categories }
  it { should belong_to :user }
end
