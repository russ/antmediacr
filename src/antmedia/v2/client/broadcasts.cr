module Antmedia
  module V2
    class Client
      module Broadcasts
        def broadcasts_count
          JSON.parse(@resource["/rest/v2/broadcasts/count"].get.body)
        end

        def broadcasts_create(broadcast : Broadcast)
          JSON.parse(
            @resource["/rest/v2/broadcasts/create"].post(
              params: {
                :name => broadcast.name,
              }
            ).body
          )
        end

        def broadcast(broadcast_id : String)
          JSON.parse(@resource["/rest/v2/broadcasts/#{broadcast_id}"].get.body)
        end

        def broadcast_stream_info(broadcast_id)
          JSON.parse(@resource["/rest/v2/broadcasts/#{broadcast_id}/stream-info"].get.body)
        end

        def broadcast_statistics(broadcast_id)
          JSON.parse(@resource["/rest/v2/broadcasts/#{broadcast_id}/broadcast-statistics"].get.body)
        end
      end
    end
  end
end
