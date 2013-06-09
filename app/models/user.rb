class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :password_digest, :username

  has_many :repos


  def self.authenticate(username, password)
    user = User.find_by_username(username)
    unless user
      raise "No user with such username"
    end

    unless user.authenticate(password)
       raise "password invalid"
    end
    user
  end

end
