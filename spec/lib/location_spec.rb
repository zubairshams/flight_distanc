require 'spec_helper'
require 'location'

RSpec.describe Location do
  describe '#valid?' do
    context 'true' do
      specify do
        expect(Location.new('Dhaka', 23.85, 90.40).valid?).to be_truthy
      end
    end

    context 'true' do
      specify do
        expect(Location.new('Hong Kong', 21.75, 115).valid?).to be_falsey
      end
    end
  end
end
