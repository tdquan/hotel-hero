class CreateSoftwares < ActiveRecord::Migration[6.0]
  def change
    create_table :softwares do |t|
      t.string :name
      t.string :category
      t.references :vendor, null: false, references: :user

      t.timestamps
    end
  end
end
