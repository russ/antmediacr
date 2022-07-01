require "json"
require "spec"
require "webmock"
require "../src/antmedia"

ANTMEDIA_ENDPOINT = "http://localhost:5080/LiveApp"
JWT_SECRET_KEY    = "Vkk4xlrBJDLXy5DW7fx6Rxseu8Py8tQ9"

Antmedia::V2::Client.config do |config|
  config.end_point = ANTMEDIA_ENDPOINT
  config.jwt_secret_key = JWT_SECRET_KEY
end

Spec.before_each &->WebMock.reset
