require_relative '../../../spec/spec_helper'

class TileFYPScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    # Push Notifications
  #  wait_and_accept_alert
   # wait_for { start_using_tile.displayed? }
  end

  # Methods
 

  def start_using_tile
    @driver.find_element(:id, 'Start using Tile')
  end
end
