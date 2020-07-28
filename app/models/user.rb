class User < ApplicationRecord
    has_many :scheduled_workouts
    has_many :workouts, through: :scheduled_workouts
    has_many :exercises
    has_secure_password

    validates :name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true
    validates :password, confirmation: { case_sensitive: true }
    
end
