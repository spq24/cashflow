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

FactoryGirl.define do
  factory :transaction do
    description "MyString"
    amount_in_cents 1.5
    debit false
    credit false
    notes "MyText"
    user nil
    date_recorded "2017-09-11 02:52:38"
    category
  end
end
