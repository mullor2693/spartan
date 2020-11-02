class Diet < ApplicationRecord
  include Weekable

  alias_attribute :creator, :user

  belongs_to :user
  has_many :meals

  before_validation :clean_weekdays

end
