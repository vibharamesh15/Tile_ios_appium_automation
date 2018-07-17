# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class BluetoothCoachmarkScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    wait_for { continue_button }
  end

  def continue_button
    @driver.find_element(:name, 'btn_coachmark_ok')
  end

  def dismiss_coachmark
    continue_button.click
  end
end
