require_relative '../../../spec/spec_helper'

class ConfirmFBAuthScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
  end

  

  def continue
    @driver.find_element(:name, 'Continue')
  end
end
