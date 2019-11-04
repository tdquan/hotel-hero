class CreateSoftwareSuites < ActiveRecord::Migration[6.0]
  def change
    create_table :software_suites do |t|
      t.string :name
      t.string :category, null: false
      t.references :hotelier, null: false, references: :user

      t.timestamps
    end
  end
end
