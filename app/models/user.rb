class User < ActiveRecord::Base

    has_many :teams

    validates :username, presence: true
    validates :password, presence: true
    validates_uniqueness_of :email
    validates_uniqueness_of :username
    has_secure_password
    
end