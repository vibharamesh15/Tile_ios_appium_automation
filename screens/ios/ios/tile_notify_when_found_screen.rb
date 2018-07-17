# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class NotifyWhenFoundScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    wait_for { done_button }
  end

  def done_button
    @driver.find_element(:id, 'Done') # TODO: a11y
  end
end
