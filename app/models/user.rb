class User < ApplicationRecord
    has_secure_password
    has_many :notes

    validates :username, presence:true, uniqueness:true
    validates :email, presence:true
    validates :name, presence:true
    validates :age, presence:true
    validates :password, presence:true, uniqueness:true, length: {minimum:6}



end
