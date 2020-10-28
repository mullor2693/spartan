class Diet < ApplicationRecord
  include Weekable

  belongs_to :user
  has_many :meals

  before_validation :clean_weekdays

end
