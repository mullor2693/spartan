class Workout < ApplicationRecord
  include Weekable

  belongs_to :user
  has_many :exercise_workouts
  has_many :exercises, -> { distinct }, through: :exercise_workouts

  before_validation :clean_weekdays
  
end
