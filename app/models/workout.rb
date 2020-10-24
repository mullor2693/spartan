class Workout < ApplicationRecord
  belongs_to :user
  # serialize :training_days
end
