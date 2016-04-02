require 'spec_helper'
require 'location'
require 'flight'
require 'flight_list'

RSpec.describe FlightList do
  let(:loc1) { Location.new('Dhaka', 23.85, 90.40) }
  let(:loc2) { Location.new('Chittagong', 22.25, 91.83) }
  let(:loc3) { Location.new('Calcutta', 22.53, 88.36) }
  let(:flight1) { Flight.new(loc1, loc2) }
  let(:flight2) { Flight.new(loc2, loc1) }
  let(:flight3) { Flight.new(loc1, loc3) }

  before(:each) do
    @flight_list = FlightList.new
    @flight_list.add(flight1)
    @flight_list.add(flight2)
    @flight_list.add(flight3)
  end

  describe '#add' do
    specify do
      expect(FlightList.new.add(flight1)).to include('Dhaka' => {'Chittagong' => 231})
    end
  end

  describe '#query' do
    context 'route exists' do
      specify do
        expect(@flight_list.query('Chittagong', 'Calcutta')).to eq('486 km')
      end
    end

    context 'no route exists' do
      specify do
        expect(@flight_list.query('Calcutta', 'Chittagong')).to eq('no route exists')
      end
    end
  end

  describe '#find_distance' do
    context 'no flight' do
      specify do
        distance = @flight_list.find_distance('Calcutta', 'Chittagong', @flight_list.flight_list, 0)
        expect(distance).to eq(0)
      end
    end

    context 'direct flight' do
      specify do
        distance = @flight_list.find_distance('Dhaka', 'Chittagong', @flight_list.flight_list, 0)
        expect(distance).to eq(231)
      end
    end

    context 'connecting flights' do
      specify do
        distance = @flight_list.find_distance('Chittagong', 'Calcutta', @flight_list.flight_list, 0)
        expect(distance).to eq(486)
      end
    end
  end
end
