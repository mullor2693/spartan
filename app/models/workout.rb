class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercise_workouts
  has_many :exercises, -> { distinct }, through: :exercise_workouts

  TRAINING_DAYS = ["L", "M", "X", "J", "V", "S", "D"].freeze

  def selected_training_days    
    # selected_values = []
    # training_days.each do |key, value|
    #   selected_values << key if value
    # end
    # selected_values.to_sentence
    training_days
  end
end
