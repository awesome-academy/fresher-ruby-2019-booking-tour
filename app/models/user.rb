class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :omniauthable, omniauth_providers: %i(facebook).freeze
  has_many :likes, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bank_accounts, dependent: :destroy
  has_one :picture, as: :picturetable, dependent: :destroy
  VALID_EMAIL_REGEX = Settings.users.email.regex
  validates :name, presence: true,
   length: {maximum: Settings.users.name.max_length}
  validates :email, presence: true,
    length: {maximum: Settings.users.email.max_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :phone_number, presence: true, allow_nil: true
  validates :password, presence: true, allow_nil: true
  accepts_nested_attributes_for :picture, allow_destroy: true
  enum role: {guest: 0, user: 1, admin: 2}
  
  def liked? review_id
    self.likes.find_by(review_id: review_id).present?
  end
  
  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.id).first_or_create do |user|
        user.email = auth.info.email
        user.name = auth.info.name
        user.uid = auth.uid
        user.image = auth.info.image
        user.password = Devise.friendly_token[Settings.users.min_password_length,
          Settings.users.max_password_length]
      end
    end
  end

  def new_with_session params, session
    tap do |user|
      if data = session["devise.#facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        next unless user.email.blank?
        user.email = data["email"]
      end
    end
  end
end
