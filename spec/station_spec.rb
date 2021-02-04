require 'station'

describe Station do
  london_bridge = Station.new("London Bridge", 1)

  it 'has a name on creation' do
    expect(london_bridge.name).to eq "London Bridge"
  end

  it 'has a zone on creation' do
    expect(london_bridge.zone).to eq 1
  end
end