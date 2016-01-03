class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(password_plaintext)
    @password = BCrypt::Password.create(password_plaintext)
    self.password_hash = @password
  end

  def authenticate(password)
    return self.password == password
  end
end