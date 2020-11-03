class User < ActiveRecord::Base

    has_many :teams

    validates :username, presence: true
    validates :password, presence: true
    validates_uniqueness_of :email
    validates_uniqueness_of :username
    has_secure_password

    def slug
        username.downcase.split(" ").join("-")
    end

    def self.find_by_slug(slug)
        self.all.find_by{|x| x.slug == slug}
    end
    
end