require 'bcrypt'
class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :password_digest, Text

  validates_confirmation_of :password, message: "Your password and password confirmation must match"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
  
end