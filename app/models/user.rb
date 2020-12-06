class User < ApplicationRecord
  # Includes
  rolify
  devise :database_authenticatable, :recoverable, :validatable, :trackable
  include Imageable

  # Associations
  has_many :user_workouts
  has_many :workouts, through: :user_workouts
  has_many :weights, -> { order(evaluation_date: :desc) }
  has_many :measurements
  has_many :evaluations, inverse_of: :user
  has_many :user_diets
  has_many :diets, through: :user_diets
  has_one_attached :avatar

  # Callbacks
  # before_save :set_default_avatar

  # Validation
  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true

  # Attributes
  def nickname
    full_name.present? ? full_name : email
  end

  def full_name
    [(name.try(:strip) || ""), (surname.try(:strip) || "")].join(" ").strip
  end

  def last_weight
    weights.present? ? weights.first : nil
  end

  def track_info
    { id: id, email: email }
  end

  def get_evaluable_info(info=[])
    info = Evaluation::EVALUABLE_ATTRIBUTES-(Evaluation::EVALUABLE_ATTRIBUTES-info)
    r_arr = []
    info.each do |ev|
      r_hash = {}
      evaluations.order(evaluation_date: :desc).each do |uev|
        r_hash[uev.evaluation_date.to_date] = uev[ev]
      end
      r_arr << {name: ev.humanize, data: r_hash}
    end
    return r_arr
  end

  # Object Methods
  def avatar_sized(size)
      avatar.variant(Imageable.sizes[size]).processed
  end


  # Class Methods
  def self.html_from_track_info(info)
    user = User.find(info["id"])
    if( user.present? )
      "<a class='user-link' href='#{admin_user_path(user.id)}'><span class='user-pill'>#{image_tag(user.avatar)}<b>#{user.name}</b></span></a>".html_safe
    else
      info["email"].html_safe
    end
  end

  private 

  def set_default_avatar
    self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'users', 'avatar.png')), filename: 'avatar.png', content_type: 'image/png') unless self.avatar.attached? 
  end

end
