require "json"
require "spec"
require "webmock"
require "../src/antmedia"

ANTMEDIA_ENDPOINT = "http://localhost:5080/LiveApp"
JWT_SECRET_KEY    = "Vkk4xlrBJDLXy5DW7fx6Rxseu8Py8tQ9"

def generate_jwt_token
  payload = {
    "sub" => "token",
    "nbf" => Time.utc.to_unix,
    "iat" => Time.utc.to_unix,
    "exp" => Time.utc.to_unix + 100,
  }

  JWT.encode(payload, JWT_SECRET_KEY, JWT::Algorithm::HS256)
end

Spec.before_each &->WebMock.reset
