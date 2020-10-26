class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :rememberable, :registerable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :validatable, :trackable

  has_many :workouts
  has_many :weights
  has_many :measurements
  has_many :evaluations
  
  def nickname
    full_name.present? ? full_name : email
  end

  def full_name
    [(name.try(:strip) || ""), (surname.try(:strip) || "")].join(" ").strip
  end

end
