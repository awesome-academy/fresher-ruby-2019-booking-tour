class Tour < ApplicationRecord
  belongs_to :category
  has_one :picture, as: :picturetable, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :revenues, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true
  validates_numericality_of :duration,
  greater_than_or_equal_to: Settings.tours.duration.day_number
  validates_numericality_of :price,
  greater_than_or_equal_to: Settings.tours.price.default_price

  scope :last_tours, ->{order created_at: :desc}
  scope :user_rated, -> {includes(:ratings).count(:user_id)}
  delegate :name, to: :category, prefix: true, allow_nil: true
  accepts_nested_attributes_for :picture, allow_destroy: true
  
  TOUR_PARAMS = [:name, :description, :duration, :price, :category_id,
    picture_attributes: %i(id picture_link _destroy)]
  PARAMS_SEARCH = %w(name description duration price).freeze
  
  def load_picture
    self.build_picture ||= self.picture
  end

  private

  def self.ransackable_attributes auth_object = nil
    auth_object.eql?(:admin) ? super : (super & PARAMS_SEARCH)
  end
end
