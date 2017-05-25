class ModifyAndAddFieldToReporters < ActiveRecord::Migration[5.1]
  def change
    change_table :reporters do |t|
      t.remove :is_neutered
      t.rename :species, :pet_species
      t.rename :sex, :pet_gender
      t.rename :predominat_color, :pet_color
      t.remove :markings
      t.rename :other_info, :extra_info
      t.string :pet_breed
      t.boolean :is_found, default: false
    end
  end
end
