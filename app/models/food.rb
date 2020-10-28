class Food < ApplicationRecord
    COMPONENT_GROUPS = {1=>"Proximales", 2=>"Hidratos de Carbono", 3=>"Grasas", 4=>"Proteínas", 5=>"Ácidos orgánicos", 6=>"Vitaminas", 7=>"Minerales", 14=>"Compuestos carotenoides"}.freeze
    
    has_many :meal_foods
    has_many :meals, -> { distinct }, through: :meal_foods

end
