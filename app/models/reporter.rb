class Reporter < ApplicationRecord
  mount_uploader :pet_photo, PhotoUploader
  validates :pet_name, presence: true
  validates :pet_species, presence: true
  validates :pet_gender, presence: true
  validates :pet_color, presence: true
  validates :lost_date, presence: true
  validates :lost_city, presence: true
  validates :lost_place, presence: true
  validates :contact, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
end
