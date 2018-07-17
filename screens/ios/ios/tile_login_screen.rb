# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class TileLoginScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    wait_for { btn_login.displayed? }
  end

  # Elements

  def btn_login_facebook
    @driver.find_element(:name, 'btn_welcome_facebook_login')
  end

   def btn_forgot_password
    @driver.find_element(:name, 'btn_forgot_password')
  end


  def btn_wrong_info
    @driver.find_element(:name, 'OK')
  end


  def btn_login
    @driver.find_element(:name, 'btn_welcome_login')
  end

  def btn_sign_up
    @driver.find_element(:name, 'btn_welcome_register')
  end

  def btn_sign_up_registration
    @driver.find_element(:name, 'btn_signup')
  end

  def txt_email
    @driver.find_element(:name, 'txt_edit_email')
  end

  def txt_password
    @driver.find_element(:name, 'txt_edit_password')
  end

  def btn_login_screen_login
    @driver.find_element(:name, 'btn_login')
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
  def login_with(username, password)
    $logger.info('[LOGIN SCREEN] login_with')
    btn_login.click
    $logger.info('[LOGIN SCREEN] wait_for email')
    wait_for { txt_email.displayed? }

    $logger.info('[LOGIN SCREEN] enter_credentials')
    txt_email.clear
    txt_email.send_keys(username)

    txt_password.clear
    txt_password.send_keys(password)

    $logger.info('[LOGIN SCREEN] login_click')
    btn_login_screen_login.click

    # puts '[LOGIN SCREEN] wait_for loader'
    # wait_for { loader }
  end

 

end
