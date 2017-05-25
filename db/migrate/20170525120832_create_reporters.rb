class CreateReporters < ActiveRecord::Migration[5.1]
  def change
    create_table :reporters do |t|
      t.string :pet_name
      t.string :pet_photo
      t.string :species
      t.string :sex
      t.string :is_neutered
      t.string :predominat_color
      t.string :markings
      t.date :lost_date
      t.string :lost_city
      t.string :lost_place
      t.text :other_info
      t.string :contact
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
