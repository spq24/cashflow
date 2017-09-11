class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :description, default: ""
      t.float :amount_in_cents, default: 0.0
      t.boolean :debit, default: false
      t.boolean :credit, default: false
      t.text :notes, default: ""
      t.belongs_to :user, foreign_key: true
      t.datetime :date_recorded

      t.timestamps
    end
  end
end
