module Antmedia
  module V2
    class Client
      module Broadcasts
        def broadcast(broadcast_id : String) : Broadcast
          response = @resource["/rest/v2/broadcasts/#{broadcast_id}"].get.body
          Broadcast.from_json(response)
        end

        def broadcasts_create(broadcast : Broadcast) : Broadcast
          response = @resource["/rest/v2/broadcasts/create"].post(form: broadcast.to_json).body
          Broadcast.from_json(response)
        end

        def broadcasts_update(broadcast : Broadcast) : Broadcast
          response = @resource["/rest/v2/broadcasts/#{broadcast.stream_id}"].put(form: broadcast.to_json).body
          Broadcast.from_json(response)
        end

        def broadcasts_delete(broadcast : Broadcast) : JSON::Any
          response = @resource["/rest/v2/broadcasts/#{broadcast.stream_id}"].delete.body
          JSON.parse(response)
        end

        def broadcasts_stop(broadcast : Broadcast) : JSON::Any
          response = @resource["/rest/v2/broadcasts/#{broadcast.stream_id}/stop"]
            .post(form: %({"id":"#{broadcast.stream_id}"}))
            .body
          JSON.parse(response)
        end

        def broadcasts_token(broadcast : Broadcast, expires_at : Time, type : String) : JSON::Any
          response = @resource["/rest/v2/broadcasts/#{broadcast.stream_id}/token"]
            .post(form: %({"id":"#{broadcast.stream_id}", "expireDate":"#{expires_at.to_unix}", "type":"#{type}"}))
            .body
          JSON.parse(response)
        end

        def broadcasts_delete_tokens(broadcast : Broadcast) : JSON::Any
          response = @resource["/rest/v2/broadcasts/#{broadcast.stream_id}/token"]
            .delete(form: %({"id":"#{broadcast.stream_id}"}))
            .body
          JSON.parse(response)
        end

        def broadcasts_count
          JSON.parse(@resource["/rest/v2/broadcasts/count"].get.body)
        end

        def broadcasts_active_live_stream_count : JSON::Any
          JSON.parse(@resource["/rest/v2/broadcasts/active-live-stream-count"].get.body)
        end
      end
    end
  end
end
