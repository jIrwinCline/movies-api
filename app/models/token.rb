class Token < ApplicationRecord

  def self.generate
    token_salt = BCrypt::Engine.generate_salt
    token_hash = BCrypt::Engine.hash_secret(Time.new.to_s ,token_salt).delete!("/.$\\")
    token = Token.new(:token_salt => token_salt, :token_hash => token_hash)
    token.save!
    return token
  end
end
