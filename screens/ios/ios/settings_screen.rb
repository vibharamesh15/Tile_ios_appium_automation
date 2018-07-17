# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class TileSettingsScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
  end

  def close_button
    @driver.find_element(:id, 'btn_close')
  end

  def full_name
    @driver.find_element(:id, 'Full Name') # button: btn_full_name
  end

  def change_password
    @driver.find_element(:id, 'Change Password') # button: btn_change_password
  end

  def show_phone_in_tile_list
    @driver.find_elements(:xpath, '//XCUIElementTypeSwitch')[0] # radio: show_phone_in_tile_list
  end

  def manage_hidden_tiles
    @driver.find_element(:id, 'Manage Hidden Tiles').click # TODO: a11y
  end

  def verify_account
    @driver.find_element(:id, 'Verify Account') # button: btn_verify_account
  end

  def use_bluetooth
    @driver.find_elements(:xpath, '//XCUIElementTypeSwitch')[1] # radio: use_bluetooth
  end

  def iphone_battery_savings
    @driver.find_elements(:xpath, '//XCUIElementTypeSwitch')[2] # radio: iphone_battery_savings
  end

  def back_button
    @driver.find_element(:id, 'Back') # button: in-app browser back
  end

  def help_center
    @driver.find_element(:id, 'Help Center') # button: btn_help_center
  end

  def privacy_policy
    @driver.find_element(:id, 'Privacy Policy') # button: btn_privacy_policy
  end

  def terms_of_service
    @driver.find_element(:id, 'Terms of Service') # button: btn_terms_of_service
  end

  def report_issue
    @driver.find_element(:id, 'Report Issue') # button: btn_report_issue
  end

  def credits
    @driver.find_element(:id, 'Credits') # button: btn_credits
  end

  def loader
    @driver.find_element(:xpath, '//XCUIElementTypeActivityIndicator')
  end

  def logout_button

    @driver.find_element(:name, 'btn_logout')

  end

  def logout
    logout_button.click
  end

  def toggle_phone_in_list
    wait_for { @driver.find_element(:xpath, "//XCUIElementTypeStaticText/following::XCUIElementTypeSwitch") }
    @driver.find_element(:xpath, "//XCUIElementTypeStaticText/following::XCUIElementTypeSwitch").click
    # Needed for the old driver / TODO: Cleanup
    # cells = 1
    # @driver.find_elements(:xpath, '//XCUIElementTypeCell').each do |cell|
    #   begin
    #     if cell.find_element(:xpath, '//XCUIElementTypeStaticText').text == 'Show Phone in Tile List'
    #       @driver.find_element(:xpath, "//XCUIElementTypeCell[#{cells}]").find_element(:xpath, '//XCUIElementTypeSwitch').click
    #     end
    #   rescue Selenium::WebDriver::Error::NoSuchElementError
    #     $logger.warn('NoSuchElementError on Toggle Phone')
    #   end
    #   cells += 1
    # end
  end

  def unhide(tile_name)
    wait_for { @driver.find_element(:xpath, "//XCUIElementTypeStaticText/following::XCUIElementTypeButton") }
    @driver.find_element(:xpath, "//XCUIElementTypeStaticText/following::XCUIElementTypeButton").click
    # Needed for the old driver / TODO: Cleanup
    # cells = 1
    # @driver.find_elements(:xpath, '//XCUIElementTypeCell').each do |cell|
    #   begin
    #     if cell.find_element(:xpath, '//XCUIElementTypeStaticText').text == tile_name
    #       @driver.find_element(:xpath, "//XCUIElementTypeCell[#{cells}]").find_element(:xpath, '//XCUIElementTypeButton').click
    #     end
    #   rescue Selenium::WebDriver::Error::NoSuchElementError
    #     $logger.warn('NoSuchElementError on unhide')
    #   end
    #   cells += 1
    # end
  end
end
