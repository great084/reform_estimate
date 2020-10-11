class CreateEstimates < ActiveRecord::Migration[6.0]
  def change
    create_table :estimates do |t|
      t.bigint :user_id
      t.string :subject, null: false
      t.string :customer_name, null: false
      t.integer :subtotal
      t.integer :consumption_tax
      t.integer :grand_total
      t.timestamps
    end
  end
end
