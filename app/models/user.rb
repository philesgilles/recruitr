class User < ActiveRecord::Base
    has_many :articles
    before_save {self.email = email.downcase}
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum:3, maximum:25}
    validates :email, presence: true, length: { maximum:100}, uniqueness: { case_sensitive: false }, format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/}
    has_secure_password
    private
        
end