require "crest"
require "json"
require "uri"
require "./v2/client/*"

module Antmedia
  module V2
    class Client
      include Antmedia::V2::Client::Broadcasts

      property uri : URI
      property resource : Crest::Resource

      def initialize(end_point : String)
        @uri = URI.parse(end_point)
        @resource = Crest::Resource.new(
          @uri.to_s,
          headers: {
            "Accept"       => "application/json",
            "Content-Type" => "application/json",
          },
          json: true,
        )
      end
    end
  end
end
