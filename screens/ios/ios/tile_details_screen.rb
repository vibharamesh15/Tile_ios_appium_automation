# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class TileDetailsScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    wait_for { @driver.find_element(:id, 'TILTileDetailsVersion2View') }
  end

  def back_button
    @driver.find_element(:id, 'Back')
  end

  def options_tab
    @driver.find_element(:id, 'Options')
  end

  def tips_tab
    @driver.find_element(:id, 'Tips')
  end

  def view_on_map
    @driver.find_element(:id, 'View on map')
    # Old Driver
    # @driver.find_ele_by_attr('XCUIElementTypeStaticText', 'label', 'View on map')
    @driver.find_element(:xpath, "//XCUIElementTypeStaticText[@label='View on map']")
  end

  def share
    #binding.pry
    # Old Driver
    # @driver.find_ele_by_attr('XCUIElementTypeStaticText', 'label', 'Share')
    @driver.find_element(:xpath, "//XCUIElementTypeStaticText[@label='Share']")
  end

  def share_with
    # Old Driver
    # @driver.find_ele_by_attr('XCUIElementTypeStaticText', 'label', 'Shared with')
    @driver.find_element(:xpath, "//XCUIElementTypeStaticText[@label='Shared With']")
  end

  def details
    # Old Driver
    # @driver.find_ele_by_attr('XCUIElementTypeStaticText', 'label', 'Details')
    @driver.find_element(:xpath, "//XCUIElementTypeStaticText[@label='Details']")
  end

  def find_button
   # @driver.find_element(:id, 'btn_find') && @driver.find_element(:id, 'btn_find').label == 'Find'

   @driver.find_element(:id, 'btn_find')
  end

  def isringing
    @driver.find_element(:id, 'btn_find') && @driver.find_element(:id, 'btn_find').label == 'Done' && @driver.find_element(:id, 'btn_find').enabled?
  end

  def mark_as_lost
    mark_as_lost_button.click
  end

  def mark_as_lost_button
    @driver.find_element(:name, 'btn_mark_as_lost')
  end

  def dismiss_tooltip
    @driver.find_element(:id, 'btn_dismiss').click
    wait_for { @driver.find_element(:id, 'Remind Me Later') } # TODO: a11y
    @driver.find_element(:id, 'Remind Me Later').click
  end

  def undo
    undo_button.click
  end

  def undo_button
    @driver.find_element(:id, 'lbl_info')
  end

  def tile_name
    @driver.find_element(:id, 'lbl_tile_name')
  end

  def share_with_alert_title
    # Share this Tile
    @driver.find_element(:xpath, '//XCUIElementTypeAlert//XCUIElementTypeStaticText[1]').text
  end

  def share_with_alert_contents
    # 'Give another person access to your <> for extra finding power. They'll be able to see this Tile in their app, ring it and update its location.'
    @driver.find_element(:xpath, '//XCUIElementTypeAlert//XCUIElementTypeStaticText[2]').text
  end

  def share_with_enter_email_title
    # 'Enter the email address of the person you'd like to share with'
    @driver.find_element(:xpath, '//XCUIElementTypeAlert//XCUIElementTypeStaticText[1]').text
  end

  def share_with_enter_email_field
    @driver.find_ele_by_attr('XCUIElementTypeTextField', 'label', '')
  end

  def share_with_invalid_email
    # 'Please try again with a complete email address (example@domain.com)'
    # 'Not a Valid Email'
  end

  def accept_share_with_alert
    @driver.switch_to.alert.accept
  end

  def deny_share_with_alert
    @driver.alert_deny
  end

  def help
    $logger.info('TODO: help center')
  end
end
