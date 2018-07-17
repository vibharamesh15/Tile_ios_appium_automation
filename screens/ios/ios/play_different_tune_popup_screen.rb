# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class PlayDifferentTunePopup
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    wait_for { choose_ringtone_button }
  end

  def cancel_button
    @driver.find_element(:id, 'Cancel') # TODO: a11y
  end

  def choose_ringtone_button
    @driver.find_element(:id, 'Choose Ringtone') # TODO: a11y
  end
end
