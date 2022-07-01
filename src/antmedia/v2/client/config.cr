module Antmedia
  module V2
    class Config
      property end_point : String
      property jwt_secret_key : String?

      def initialize
        @end_point = ENV["ANTMEDIA_API_URL_ENDPOINT"]? || ""
      end
    end
  end
end
