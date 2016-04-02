class FlightList
  attr_reader :flight_list

  def initialize
    # flight list as hashes e.g {"Dhaka" => {"Chittagong" => 231, "Calcutta" => 254}}
    @flight_list = Hash.new { |hash, key| hash[key] = {} }
  end

  def add(flight)
    s = flight.src.name
    d = flight.dest.name

    @flight_list[s].merge! d => flight.distance
    @flight_list[d]

    return @flight_list
  end

  def query(src, dest)
    distance = 0
    hash = {}
    flight_list.each {|k, v| hash[k.dup] = v.dup}

    if src != dest && hash.has_key?(src) && hash.has_key?(dest)
      distance = find_distance(src, dest, hash, distance)
    end

    return distance > 0 ? "#{distance} km" : "no route exists"
  end

  def find_distance(src, dest, hash, distance)
    return 0 if hash[src].empty?

    # adds available flight distance.
    return distance + hash[src][dest] if hash[src].has_key?(dest)

    hash[src].each do |k, v|
      # delete visited src/dest to avoid cycle.
      hash[src].delete(k)
      hash[k].delete(src)

      distance = find_distance(k, dest, hash, distance + v)
      break if distance > 0
    end

    return distance
  end
end
