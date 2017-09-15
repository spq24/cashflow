# == Schema Information
#
# Table name: transactions
#
#  id              :integer          not null, primary key
#  description     :string           default("")
#  amount_in_cents :float            default(0.0)
#  debit           :boolean          default(FALSE)
#  credit          :boolean          default(FALSE)
#  notes           :text             default("")
#  user_id         :integer
#  date_recorded   :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer
#

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it "should have a valid factory" do
  	expect(build(:transaction)).to be_valid
  end

  it { should belong_to :user }
  it { should belong_to :category }
  it { should validate_presence_of :description }
  it { should validate_presence_of :amount_in_cents }
  it { should validate_presence_of :date_recorded }

  context "#user_full_name" do
  	it "returns the full name of the user if present" do
  		user = create(:user)
  		transaction = create(:transaction, user_id: user.id)
  		expect(transaction.user_full_name).to eq user.full_name
  	end

  	it "returns an empty string if there is no associated user" do
  		transaction = create(:transaction)
  		expect(transaction.user_full_name).to eq ""
  	end
  end
end
