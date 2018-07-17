# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class TileListScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    begin
    wait_for { tile_list }
  rescue
    $logger.info('[TILE DETAILS SCREEN] waiting for tile list loading ')
  end
    #@driver.manage.timeouts.implicit_wait = 4 
  end

  def tile_list
    @driver.find_element(:id, 'TILMyTilesView')
  end

  def tiles
    tiles = []
    @driver.find_elements(:id, 'lbl_tile_name').each do |tile|
      tiles.push(tile.text)
    end
    tiles
  end

  def navigation_bar
    @driver.find_element(:class_name, 'XCUIElementTypeNavigationBar')
  end

  def tap_tile(tile_name)
    # Old Driver
    # @driver.find_ele_by_attr('XCUIElementTypeStaticText', 'label', tile_name).click
    wait_for { @driver.find_element(:xpath, "//XCUIElementTypeStaticText[@label='" + tile_name + "']") }
    @driver.find_element(:xpath, "//XCUIElementTypeStaticText[@label='" + tile_name + "']").click
  end

  def btn_find
     @driver.find_element(:id, 'btn_find')
  end

  def add_tile_button
    @driver.find_element(:id, 'btn_add_tile')
  end

  def add_tile_option
    @driver.find_ele_by_attr('XCUIElementTypeStaticText', 'label', 'Add a Tile')
  end

  def select_tile_type(tile_type)
    @driver.find_ele_by_attr('XCUIElementTypeStaticText', 'label', tile_type)
  end

  def add_tile_screen_title
    @driver.find_ele_by_attr('XCUIElementTypeStaticText', 'label', 'Add Tile')
  end

  def add_tile_screen_instructions
    instructions = []
    @driver.find_elements(:xpath, '//XCUIElementTypeOther/XCUIElementTypeStaticText').each do |element|
      instructions.push(element.text)
    end
    instructions
    # 1. Click the Tile logo once to begin activation -- It'll play a nice tune
    # 2. Place the Tile next to your phone
  end

  def gift_receipt_yes
    @driver.find_element(:id, 'btn_banner_gift_yes')
  end

  def gift_receipt_no
    @driver.find_element(:id, 'btn_banner_gift_no')
  end

  def settings
    @driver.find_element(:id, 'btn_settings')
  end

  def swipe_to_refresh
    Appium::TouchAction.new.swipe(start_x: 300, start_y: 300, offset_x: 300, offset_y: 300, duration: 10).perform
  end

  def map_tab
    @driver.find_element(:id, 'Map') # btn_map_tab
  end

  def notifications_tab
    @driver.find_element(:id, 'Notifications') # btn_notifications_tab
  end

  def list_tab
    @driver.find_element(:id, 'List') # btn_list_tab
  end
end
