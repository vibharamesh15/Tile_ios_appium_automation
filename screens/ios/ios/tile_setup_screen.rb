# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class TileSetupScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    wait_for { tile_setup }
  end

  # Methods
  def wait_and_accept_alert
    wait = Selenium::WebDriver::Wait.new timeout: 40
    wait.until { alert.displayed? }
    @driver.switch_to.alert.accept
  end


  def wait_and_location_accept_alert(permission)
    wait = Selenium::WebDriver::Wait.new timeout: 30
    wait.until { alert.displayed? }
    @driver.find_element(:name , permission).click
    
  end


def wait_and_continue_accept_alert

    #rescue NoSuchElementError
    @driver.find_element(:name , 'Ignore').click    
  

end


  
  def check_and_fix_permissions(plocation)
   
    begin

     # unless (btooth_enabled.displayed? == true) 
     # begin
      #  enable_bluetooth_button.click
       # wait_and_accept_alert
        #rescue Selenium::WebDriver::Error::NoSuchElementError
      # $logger.info('[SETUP] Bluetooth permissions error')
     # end


      end  
       
      
   # end

    begin
       enable_location_button.click
       wait_and_location_accept_alert(plocation)
       rescue Selenium::WebDriver::Error::NoSuchElementError
      $logger.info('[SETUP] Location permissions already okay')         
    end

    begin
      #enable_battery_savings_button.click
      #wait_and_accept_alert
    #rescue Selenium::WebDriver::Error::NoSuchElementError
     # $logger.info('[SETUP] Motion permissions already okay')
    end
  

    # enable_continue.enabled = true  
    wait_for { continue.enabled? }
    #continue.click
  end

  # Elements
  def tile_setup
    @driver.find_element(:name, 'lbl_permission_title')
  end

  def btn_ignore
    @driver.find_element(:name , 'Ignore')
  end


  def btooth_enabled
    @driver.find_element(:name,'Checkmark')
  end  

  def enable_bluetooth_button
    @driver.find_element(:name, 'btn_enable_bluetooth')
  end

  def enable_location_button
    @driver.find_element(:name, 'btn_enable_location')
  end

  def enable_battery_savings_button
    @driver.find_element(:name, 'btn_enable_advanced_battery_saving')
  end

  def alert
    @driver.find_element(:xpath, '//XCUIElementTypeAlert')
  end

  def continue
    @driver.find_element(:name, 'btn_continue')
  end

end