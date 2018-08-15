class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :surname
      t.date :dob
      t.string :address
      t.string :phone
      t.string :email
      t.boolean :healthy
      t.date :admission_date
      t.string :notes
      t.references :doctor, foreign_key: true

      t.timestamps
    end
  end
end
