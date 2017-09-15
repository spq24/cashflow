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

class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :description, :amount_in_cents, :date_recorded, presence: true

  def user_full_name
  	user.present? ? user.full_name : ""
  end

end
