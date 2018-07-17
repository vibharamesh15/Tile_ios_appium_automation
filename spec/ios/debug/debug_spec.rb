# frozen_string_literal: true

# require_relative '../../spec_helper'

describe 'The Tile App', disabled: true do
  # TODO: Cleanup, move to tapster
  # before(:suite) do
  #   tapster = TapsterActions.new
  #   if (@driver.find_elements(:id, 'Bluetooth on').size + @driver.find_elements(:id, 'Bluetooth connected').size) >= 1
  #       puts 'Bluetooth is on, cycle'
  #       2.times do
  #           tapster.bluetooth
  #       end
  #   else
  #       puts 'Bluetooth is off, turn it on'
  #       tapster.bluetooth
  #   end
  # end

  it 'should allow people to debug' do
    # helpers = TileHelpers.new @driver
    # helpers.cycle_bluetooth
    binding.pry
  end
end
