require "crest"
require "json"
require "uri"
require "./antmedia/v2/client/*"

module Antmedia
  module V2
    class Client
      include Antmedia::V2::Client::Broadcasts

      property resource : Crest::Resource

      @@config = Config.new

      def self.config
        yield @@config
      end

      def self.config : Config
        @@config
      end

      def initialize
        @resource = Crest::Resource.new(
          request_uri.to_s,
          headers: headers_for_request,
          json: true,
        )
      end

      private def request_uri
        URI.parse(@@config.end_point)
      end

      private def headers_for_request
        headers = {
          "Accept"       => "application/json",
          "Content-Type" => "application/json",
        }

        if @@config.jwt_secret_key
          headers["Authorization"] = generate_jwt_token
        end

        headers
      end

      private def generate_jwt_token
        payload = {
          "sub" => "token",
          "nbf" => Time.utc.to_unix,
          "iat" => Time.utc.to_unix,
          "exp" => Time.utc.to_unix + 100,
        }

        JWT.encode(payload, @@config.jwt_secret_key.not_nil!, JWT::Algorithm::HS256)
      end
    end
  end
end
