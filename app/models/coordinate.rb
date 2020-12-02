class Coordinate < ApplicationRecord
  attachment :image
  has_one :facility
  has_many :evaluations

  accepts_nested_attributes_for :facility, allow_destroy: true
  accepts_nested_attributes_for :evaluations, allow_destroy: true
  
  with_options presence: true do
    validates :name
    validates :address
    validates :latitude
    validates :longitude
  end

  # ある程度有名な地名じゃないと使えない・？
  #   geocoded_by :address
  #   after_validation :geocode, if: :address_changed?
end
