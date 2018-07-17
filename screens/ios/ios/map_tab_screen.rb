s# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class MapTabScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    wait_for { my_location.displayed? }
  end

  def my_location
    @driver.find_element(:id, 'My Location') # TODO: a11y
  end

  def select_tile(tile_name)
    2.times do
      @driver.find_element(:id, tile_name).click
    end
  end
end
