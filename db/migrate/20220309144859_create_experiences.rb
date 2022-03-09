class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true, null: true
      t.boolean :verified, default: false
      t.string :insurance_provider

      t.timestamps
    end
  end
end
