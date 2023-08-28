class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :type
      t.date :certification_date
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
