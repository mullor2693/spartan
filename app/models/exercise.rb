class Exercise < ApplicationRecord

    CATEGORIES = ["completo", "dorsal", "pecho", "hombros", "piernas", "brazos"].freeze
    MUSCLE_GROUPS = ["pecho alto", "pecho medio", "pecho bajo", "espalda alta", "espalda media", "espalda baja", "cuádriceps", "femorales", "hombro", "deltoides", "bíceps", "tríceps", "antebrazos", "pantorrillas"].freeze   

    has_many :exercise_workouts
    has_many :workouts, -> { distinct }, through: :exercise_workouts
    
    has_many_attached :examples

    validates :name, presence: true
    validates :name, uniqueness: true
end
