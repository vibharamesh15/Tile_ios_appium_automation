require_relative '../../../spec/spec_helper'

class ConfirmFBAuthScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
  end

  

  def login
    @driver.find_element(:name, 'Log In')
  end
end
