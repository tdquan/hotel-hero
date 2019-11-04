class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :payment_scheme
      t.references :software, null: false, foreign_key: true
      t.references :software_suite, null: false, foreign_key: true

      t.timestamps
    end
  end
end
