require_relative '../../../spec/spec_helper'

class TileSignupScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    wait_for { btn_signup.displayed? }
  end

  # Elements

 

  
  def txt_email
    @driver.find_element(:name, 'txt_email')
  end

  def txt_password
    @driver.find_element(:name, 'txt_password')
  end

  def btn_signup
    @driver.find_element(:name, 'btn_signup')
  end

  def unable_signup
    @driver.find_element(:name, 'OK')
  end


  def loader
    @driver.find_element(:xpath, '//XCUIElementTypeActivityIndicator')
  end

  def registration_alert
    @driver.find_element(:xpath, '//XCUIElementTypeAlert')
  end

  def registration_alert_title
    @driver.find_element(:xpath, '//XCUIElementTypeAlert//XCUIElementTypeStaticText[1]')
  end

  def registration_alert_contents
    @driver.find_element(:xpath, '//XCUIElementTypeAlert//XCUIElementTypeStaticText[2]')
  end

  

  # Actions
  

  def signup_with(username, password)
    $logger.info('[Signup SCREEN] login_with')
    
    $logger.info('[Signup SCREEN] wait_for email')
    #wait_for { txt_email.displayed? }

    $logger.info('[Signup SCREEN] enter_credentials')
    txt_email.clear
    txt_email.send_keys(username)

    txt_password.clear
    txt_password.send_keys(password)

    $logger.info('[LOGIN SCREEN] login_click')
    btn_signup.click



    # puts '[LOGIN SCREEN] wait_for loader'
    end
end
