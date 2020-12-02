require 'station'

describe Station do

  it "takes a name" do
    london = Station.new("London", 1)
    expect(london.name).to eq "London"
  end

  it "takes a zone" do
    london = Station.new("London", 1)
    expect(london.zone).to eq 1
  end
end