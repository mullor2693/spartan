class Exercise < ApplicationRecord

    has_many :exercise_workouts
    has_many :workouts, -> { distinct }, through: :exercise_workouts
    
    has_many_attached :examples
end
