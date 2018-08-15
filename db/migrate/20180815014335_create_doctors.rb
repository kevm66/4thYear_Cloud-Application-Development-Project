class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :firstname
      t.string :surname
      t.date :dob
      t.string :address
      t.string :phone
      t.string :email
      t.string :specialisation

      t.timestamps
    end
  end
end
