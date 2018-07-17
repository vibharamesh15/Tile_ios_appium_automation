# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class UnconfirmedAccountScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
  end

  def confirm_email_title
    @driver.find_ele_by_attr('XCUIElementTypeStaticText', 'label', 'Confirm Email')
  end

  def cancel_button
    @driver.find_element(:id, 'CancelIcon')
  end
end
