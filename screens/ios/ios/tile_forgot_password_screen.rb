require_relative '../../../spec/spec_helper'

class TileForgotPassword
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
  end

  def send_email
    @driver.find_element(:id, 'btn_send')
  end

  def txt_email
    @driver.find_element(:id, 'txt_email')
  end

  def pwd_reset_ok
    @driver.find_element(:name, 'OK')
  end

 
end