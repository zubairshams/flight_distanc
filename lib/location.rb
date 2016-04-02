class Location
  attr_reader :name, :lat, :lng

  def initialize(name, lat, lng)
    @name = name
    @lat = lat
    @lng = lng
  end

  def valid?
    @name.index(' ').nil? && @name.length <= 20 && ! @lat.nil? && ! @lng.nil?
  end
end
