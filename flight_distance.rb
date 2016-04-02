Dir[File.dirname(__FILE__) + '/lib/*'].each { |file| require_relative file }

start_time = Time.now
inputs = []
outputs = []

puts 'Enter your inputs:'

while line = gets.chomp.strip
  if line == '0 0 0'
    break
  else
    inputs << line unless line == ''
  end
end

while true
  output = []
  locations = {}
  flight_list = FlightList.new
  first = inputs.delete_at(0)
  l, f, q = first.split.map(&:to_i) if first

  if l <= 100 && f <= 300 && q <= 10000
    inputs.shift(l).each do |input|
      name, lat, lng = input.split
      locations[name] = Location.new(name, lat.to_f, lng.to_f)
    end

    inputs.shift(f).each do |input|
      src, dest = input.split
      flight = Flight.new(locations[src], locations[dest])
      flight_list.add(flight)
    end

    inputs.shift(q).each do |input|
      src, dest = input.split
      output << flight_list.query(src, dest)
    end
    outputs << output
  else
    puts "Case #{outputs.count + 1} : Invalid inputs."
    inputs.shift(l + f + q)
  end

  break if inputs.empty?
end

puts

outputs.each_with_index do |output, index|
  puts "Case #{index + 1}:"
  puts output
  puts
end

puts "Finished in #{Time.now - start_time} seconds"
