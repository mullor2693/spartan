class Meal < ApplicationRecord
  include Daytimeable

  belongs_to :diet
  has_many :meal_foods
  has_many :foods, -> { distinct }, through: :meal_foods
end
