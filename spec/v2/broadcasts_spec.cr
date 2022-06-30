require "../spec_helper"

ENDPOINT = "http://localhost:5080/LiveApp"

# describe Antmedia::V2::Client::Broadcasts do
describe Antmedia do
  it "returns the broadcast count" do
    response = Antmedia::V2::Client.new(ENDPOINT).broadcasts_count
    response["number"].should eq(0)
  end

  it "creates a broadcast" do
    broadcast = Antmedia::V2::Broadcast.new(name: "Heyo")
    response = Antmedia::V2::Client.new(ENDPOINT).broadcasts_create(broadcast)
    pp! response
  end
end
