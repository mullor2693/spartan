class Diet < ApplicationRecord
  include Weekable

  alias_attribute :creator, :user

  belongs_to :user
  has_many :diet_meals
  has_many :meals, through: :diet_meals

  before_validation :clean_weekdays

  def meals_attributes=(meal_attributes)
    meal_attributes.values.each do |meal_attribute|
      meal = Meal.find_or_create_by(meal_attribute)
      self.meals << meal
    end
  end

end
