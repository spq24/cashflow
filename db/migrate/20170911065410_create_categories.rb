class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, default: ""
      t.text :description, default: ""
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
