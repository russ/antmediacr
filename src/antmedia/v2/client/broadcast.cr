module Antmedia
  module V2
    struct Broadcast
      include JSON::Serializable

      property name : String

      def initialize(@name : String)
      end
    end
  end
end

# {
#   "streamId": "string",
#   "status": "finished",
#   "playListStatus": "finished",
#   "type": "liveStream",
#   "publishType": "WebRTC",
#   "name": "string",
#   "description": "string",
#   "publish": true,
#   "date": 0,
#   "plannedStartDate": 0,
#   "plannedEndDate": 0,
#   "duration": 0,
#   "endPointList": [
#     {
#       "status": "string",
#       "type": "string",
#       "rtmpUrl": "string",
#       "endpointServiceId": "string"
#     }
#   ],
#   "playListItemList": [
#     {
#       "streamUrl": "string",
#       "type": "string"
#     }
#   ],
#   "publicStream": true,
#   "is360": true,
#   "listenerHookURL": "string",
#   "category": "string",
#   "ipAddr": "string",
#   "username": "string",
#   "password": "string",
#   "quality": "string",
#   "speed": 0,
#   "streamUrl": "string",
#   "originAdress": "string",
#   "mp4Enabled": 0,
#   "webMEnabled": 0,
#   "expireDurationMS": 0,
#   "rtmpURL": "string",
#   "zombi": true,
#   "pendingPacketSize": 0,
#   "hlsViewerCount": 0,
#   "webRTCViewerCount": 0,
#   "rtmpViewerCount": 0,
#   "startTime": 0,
#   "receivedBytes": 0,
#   "bitrate": 0,
#   "userAgent": "string",
#   "latitude": "string",
#   "longitude": "string",
#   "altitude": "string",
#   "mainTrackStreamId": "string",
#   "subTrackStreamIds": [
#     "string"
#   ],
#   "absoluteStartTimeMs": 0,
#   "webRTCViewerLimit": 0,
#   "hlsViewerLimit": 0,
#   "subFolder": "string",
#   "currentPlayIndex": 0,
#   "metaData": "string",
#   "playlistLoopEnabled": true
# }
