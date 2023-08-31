class CreateTenancies < ActiveRecord::Migration[7.0]
  def change
    create_table :tenancies do |t|
      t.date :start_date
      t.date :end_date
      t.references :property, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
