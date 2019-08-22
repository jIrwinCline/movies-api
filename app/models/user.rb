require 'bcrypt'
class User < ApplicationRecord

  before_save :encrypt_password

  # thx bcrypt documentation
  # https://github.com/codahale/bcrypt-ruby
  # users.password_hash in the database is a :string
   include BCrypt


   attr_accessor :password
   validates_confirmation_of :password
   validates :username, :presence => true, :uniqueness => true
   before_save :encrypt_password

   def encrypt_password
     self.password_salt = BCrypt::Engine.generate_salt
     self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
   end

   def self.authenticate(username, password)
     user = User.find_by_username(username)
     if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
       # send back a token
       token = Token.generate
       # token_salt = BCrypt::Engine.generate_salt
       # token_hash = BCrypt::Engine.hash_secret(Time.new.to_s ,token_salt).delete!("/.$\\")
       # token = Token.new(:token_salt => token_salt, :token_hash => token_hash)
       # token.save!
       {:message => "Successful login. Use Authorization in headers for access to API.", :authorization => token.token_hash, :url_movies => "http://localhost:3000/movies"}
     else
       {:message => "Sorry! Credentials invalid."}
     end
   end

end
