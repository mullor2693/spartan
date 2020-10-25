class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :rememberable, :registerable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :validatable, :trackable

  has_many :workouts

end
