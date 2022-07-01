require "../spec_helper"
require "jwt"

# describe Antmedia::V2::Client::Broadcasts do
describe Antmedia do
  it "fetches a broadcast" do
    stream_id = "XXXANTMEDIAXXX"

    WebMock.stub(:get, "#{ANTMEDIA_ENDPOINT}/rest/v2/broadcasts/#{stream_id}")
      .to_return(body: "{\"streamId\":\"#{stream_id}\"}")

    broadcast = Antmedia::V2::Client.new(ANTMEDIA_ENDPOINT, generate_jwt_token).broadcast(stream_id)
    broadcast.stream_id.should eq(stream_id)
  end

  it "creates a broadcast" do
    stream_id = "XXXANTMEDIAXXX"
    broadcast = Antmedia::V2::Broadcast.from_json(%({"streamId": "#{stream_id}"}))

    WebMock.stub(:post, "#{ANTMEDIA_ENDPOINT}/rest/v2/broadcasts/create")
      .with(body: broadcast.to_json)
      .to_return(body: broadcast.to_json)

    broadcast = Antmedia::V2::Client.new(ANTMEDIA_ENDPOINT, generate_jwt_token).broadcasts_create(broadcast)
    broadcast.stream_id.should eq(stream_id)
  end

  it "updates a broadcast" do
    stream_id = "XXXANTMEDIAXXX"
    broadcast = Antmedia::V2::Broadcast.from_json(%({"streamId":"#{stream_id}"}))

    WebMock.stub(:put, "#{ANTMEDIA_ENDPOINT}/rest/v2/broadcasts/#{stream_id}")
      .with(body: broadcast.to_json)
      .to_return(body: broadcast.to_json)

    broadcast = Antmedia::V2::Client.new(ANTMEDIA_ENDPOINT, generate_jwt_token).broadcasts_update(broadcast)
    broadcast.stream_id.should eq(stream_id)
  end

  it "deletes a broadcast" do
    stream_id = "XXXANTMEDIAXXX"
    broadcast = Antmedia::V2::Broadcast.from_json(%({"streamId":"#{stream_id}"}))

    WebMock.stub(:delete, "#{ANTMEDIA_ENDPOINT}/rest/v2/broadcasts/#{stream_id}")
      .to_return(body: %({"success":true}))

    response = Antmedia::V2::Client.new(ANTMEDIA_ENDPOINT, generate_jwt_token).broadcasts_delete(broadcast)
    response["success"].should eq(true)
  end

  it "stops a broadcast" do
    stream_id = "XXXANTMEDIAXXX"
    broadcast = Antmedia::V2::Broadcast.from_json(%({"streamId":"#{stream_id}"}))

    WebMock.stub(:post, "#{ANTMEDIA_ENDPOINT}/rest/v2/broadcasts/#{stream_id}/stop")
      .with(body: %({"id":"#{broadcast.stream_id}"}))
      .to_return(body: %({"success":true}))

    response = Antmedia::V2::Client.new(ANTMEDIA_ENDPOINT, generate_jwt_token).broadcasts_stop(broadcast)
    response["success"].should eq(true)
  end

  it "returns the broadcast count" do
    WebMock.stub(:get, "#{ANTMEDIA_ENDPOINT}/rest/v2/broadcasts/count").to_return(body: {number: 2}.to_json)

    response = Antmedia::V2::Client.new(ANTMEDIA_ENDPOINT, generate_jwt_token).broadcasts_count
    response["number"].should eq(2)
  end

  it "returns the active live stream broadcast count" do
    WebMock.stub(:get, "#{ANTMEDIA_ENDPOINT}/rest/v2/broadcasts/active-live-stream-count").to_return(body: {number: 2}.to_json)

    response = Antmedia::V2::Client.new(ANTMEDIA_ENDPOINT, generate_jwt_token).broadcasts_active_live_stream_count
    response["number"].should eq(2)
  end
end
