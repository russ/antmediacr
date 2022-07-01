module Antmedia
  module V2
    struct Broadcast
      include JSON::Serializable

      property name : String?
      property publish : Bool?

      @[JSON::Field(key: "rtmpURL")]
      property rtmp_url : String?

      property status : String?

      @[JSON::Field(key: "streamId")]
      property stream_id : String

      property type : String?

      @[JSON::Field(key: "hlsViewerCount")]
      property hls_viewer_count : Int32 = 0

      @[JSON::Field(key: "webViewerCount")]
      property web_rtc_viewer_count : Int32 = 0

      @[JSON::Field(key: "rtmpViewerCount")]
      property rtmp_viewer_count : Int32 = 0
    end
  end
end
