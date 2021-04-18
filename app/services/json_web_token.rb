# frozen_string_literal: true

# Handles the #encode and #decode JWT
class JsonWebToken
  def self.encode(payload)
    expiration = 60.minutes.from_now.to_i
    payload = payload.merge(exp: expiration)
    JWT.encode(payload, ENV['JWT_SECRET'])
  end

  def self.decode(token)
    JWT.decode(token, ENV['JWT_SECRET']).first
  end
end
