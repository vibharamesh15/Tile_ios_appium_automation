# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class SettingsFullNameScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
  end

  def name
    @driver.find_element(:id, 'Full Name')
  end

  def clear_text_button
    @driver.find_element(:id, '')
  end

  def enter_code(code)
    code.split('').each do |digit|
      @driver.find_elements(:class, 'XCUIElementTypeKey').each do |key|
        key.click if key.label == digit
      end
    end
  end

  def incorrect_code_toast
    # view_toast
    # lbl_toast_title => 'Incorrect Code'
    # lbl_toast_subtitle => 'Please try again'
  end
end
