require "Location"

describe Location do
  it 'initialize location' do
    location = Location.new("kgx")
    expect(location.location).to eq :kgx
  end
end