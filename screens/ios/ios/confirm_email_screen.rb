# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class ConfirmEmailScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
  end

  def send_again
    @driver.find_element(:id, 'Send again')
  end

  def change_email
    @driver.find_element(:id, 'Change Email')
  end

  def close
    @driver.find_element(:name, 'btn_close')
  end
end
