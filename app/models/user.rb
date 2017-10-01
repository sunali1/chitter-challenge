require 'bcrypt'
class User

    include DataMapper::Resource
      # has n, :peeps

    property :id, Serial
    property :username, String
    property :name, String
    property :email, Text
    property :password_digest, Text

    attr_reader :password
    attr_accessor :password_confirmation

    validates_confirmation_of :password

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end

    def self.authenticate(email, password)
      user = first(email: email)
      if user && BCrypt::Password.new(user.password_digest) == password
        user
      else
        nil
      end
    end
end
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
