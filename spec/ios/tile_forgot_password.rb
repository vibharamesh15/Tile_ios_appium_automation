 require_relative '../../../spec/spec_helper'

class ForgotPassword
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
  end

  def send
    @driver.find_element(:id, 'Send')
  end

  def txt_email
    @driver.find_element(:id, 'txt_email')
  end

 
end