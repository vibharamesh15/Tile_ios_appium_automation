# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class TileCommonScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
  end

  def alert
    @driver.find_element(:xpath, '//XCUIElementTypeAlert')
  end

  def alert_title
    @driver.find_element(:xpath, '//XCUIElementTypeAlert//XCUIElementTypeStaticText[1]')
  end

  def alert_contents
    @driver.find_element(:xpath, '//XCUIElementTypeAlert//XCUIElementTypeStaticText[2]')
  end

  def handle_tile_setup_screen
    wait_for { app.tile_setup }
  end
end
