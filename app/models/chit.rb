class Chit

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  belongs_to :user

  validates_length_of :content, :max => 140

  def user
    User.first(id: self.user_id)
  end

end

