class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  has n, :chits, :through => Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String, unique: true
  property :password_digest, Text

  validates_confirmation_of :password, message: "Your password and password confirmation must match"
  validates_uniqueness_of :username, message: "A user already exists with that username"

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