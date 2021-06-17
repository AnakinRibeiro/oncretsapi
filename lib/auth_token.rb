# frozen_string_literal: true

require 'jwt'

module AuthToken
  def self.issue_token(payload)
    payload['exp'] = 10.minute.from_now.to_i # Set expiration to 24 hours.
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end

  def self.valid?(token)
    JWT.decode(token, Rails.application.credentials.secret_key_base)
  rescue StandardError
    false
  end
end
