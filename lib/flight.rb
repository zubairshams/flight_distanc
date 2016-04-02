class Flight
  include Math
  attr_reader :src, :dest, :distance

  def initialize(src, dest)
    @src = src
    @dest = dest
    @distance = calculate_distance
  end

 private

 def calculate_distance
   r = 6378
   to_rad = Math::PI / 180
    
   p1 = @src.lat * to_rad
   p2 = @dest.lat * to_rad
   d_lat = (@dest.lat - @src.lat) * to_rad
   d_lng = (@dest.lng - @src.lng) * to_rad
    
   a = sin(d_lat/2) * sin(d_lat/2) + cos(p1) * cos(p2) * sin(d_lng/2) * sin(d_lng/2)
    
   c = 2 * atan2(sqrt(a), sqrt(1-a))
   (r * c).round
 end
end
