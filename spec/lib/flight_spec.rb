require 'spec_helper'
require 'location'
require 'flight'

RSpec.describe Flight do
  describe '#calculate_distance' do
    specify do
      src = Location.new('Dhaka', 23.85, 90.40)
      dest = Location.new('Chittagong', 22.25, 91.83)
      flight = Flight.new(src, dest)

      expect(flight.send(:calculate_distance)).to eq(231)
    end
  end
end
