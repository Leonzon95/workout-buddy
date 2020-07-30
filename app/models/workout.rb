class Workout < ApplicationRecord
  has_many :scheduled_workouts, dependent: :destroy
  has_many :users, through: :scheduled_workouts
  has_many :exercises, dependent: :destroy
  has_many :category_workouts, dependent: :destroy
  has_many :categories, through: :category_workouts
  belongs_to :user
  validates :name, presence: true

  accepts_nested_attributes_for :exercises, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }

  def self.public_workouts
    self.all.where(is_private: false)
  end
end
