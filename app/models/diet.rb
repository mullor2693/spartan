class Diet < ApplicationRecord
  include Weekable

  alias_attribute :creator, :user

  belongs_to :user
  has_many :diet_meals
  has_many :meals, through: :diet_meals

  before_validation :clean_weekdays

end
