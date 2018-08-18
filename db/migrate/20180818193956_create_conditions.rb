class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.string :name
      t.integer :severity
      t.string :remedies
      t.string :condition_type
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
