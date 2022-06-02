class JwtAuthService
  HMAC_SECRET_KEY = 'mysecretkey'.freeze
  def self.encode(payload)
    JWT.encode payload, HMAC_SECRET_KEY, 'HS256'
  end
end
