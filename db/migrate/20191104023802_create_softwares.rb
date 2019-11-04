class CreateSoftwares < ActiveRecord::Migration[6.0]
  def change
    create_table :softwares do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.string :version
      t.string :logo_url
      t.references :vendor, null: false, references: :user

      t.timestamps
    end
  end
end
