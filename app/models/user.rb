require 'bcrypt'

class User < ActiveRecord::Base
    has_many :projects
    has_many :skills

include BCrypt

#acquired from the bcrypt github repository
def password
    @password ||= Password.new(password_hash)
end

def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
end


def authenticate(password)
    self.password == password
end
    
end