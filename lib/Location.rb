class Location
  attr_reader :location
  def initialize(code)
    @location = code.to_sym
  end
end