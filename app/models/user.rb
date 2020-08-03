class User < ApplicationRecord
    has_many :scheduled_workouts
    has_many :workouts, through: :scheduled_workouts
    has_many :created_workouts, foreign_key: "user_id", class_name: "Workout"
    has_secure_password

    validates :name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    

    def scheduled_group_by_id
        self.workouts.group('id') 
    end

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:email]
            u.name = response[:info][:name]
            u.password = SecureRandom.hex(16)
        end
    end
end
