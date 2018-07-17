# frozen_string_literal: true

class TileHelpers

  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    $logger.info('[TILE HELPERS] Initialized')
  end

  #def killapp
    
   # @driver.close_app
  
  #end

  def cycle_bluetooth
    tapster = TapsterActions.new
    bluetooth = (@driver.find_elements(:id, 'Bluetooth on').size + @driver.find_elements(:id, 'Bluetooth connected').size)
    if bluetooth >= 1
      $logger.info('Bluetooth is on, cycle')
      2.times do
        tapster.bluetooth
      end
    else
      $logger.info(bluetooth)
      $logger.info('Bluetooth is off, turn it on')
      tapster.bluetooth
    end
  end

  def wait_notifications_alert
    @driver.switch_to.alert.accept
  end


 

  def login
    $logger.info('[TILE HELPERS] Login')
    app = TileLoginScreen.new @driver
    app.login_with 'vibha.ramesh@thetileapp.com', 'raghupannu'

    $logger.info('[TILE HELPERS] Login - Setup')
    app = TileSetupScreen.new @driver
    app.check_and_fix_permissions
    app.continue.click
    #wait_continue_alert

    $logger.info('[TILE HELPERS] Login - FYP')
    app = TileFYPScreen.new @driver
    app.start_using_tile.click

    app = TileListScreen.new @driver
   # @driver.close_app    

    #app
  end

def forgot_password(email)


    $logger.info('[TILE HELPERS] Forgot password')
    app = TileLoginScreen.new @driver
    app.login_with email,""
    @driver.manage.timeouts.implicit_wait = 3
    app.btn_forgot_password.click
    app = TileForgotPassword.new @driver
    @driver.manage.timeouts.implicit_wait = 3
    app.send_email.click
    @driver.manage.timeouts.implicit_wait = 3
    app.pwd_reset_ok.click
    @driver.quit


    #@driver.quit

  end


  def login_with_wrong_details(email, password)


    $logger.info('[TILE HELPERS] Login With')
    app = TileLoginScreen.new @driver
    app.login_with email, password
    @driver.manage.timeouts.implicit_wait = 5
    app.btn_wrong_info.click
    @driver.quit

  end


  
  def login_with(email, password)
    $logger.info('[TILE HELPERS] Login With')
    app = TileLoginScreen.new @driver
    app.login_with email, password

    $logger.info('[TILE HELPERS] Login - Setup')
    app = TileSetupScreen.new @driver
    app.check_and_fix_permissions('Always Allow')
    app.continue.click
   # @driver.manage.timeouts.implicit_wait = 1
   # app.wait_and_continue_accept_alert
    @driver.manage.timeouts.implicit_wait = 5
    wait_notifications_alert
    
    #app = TileFYPScreen.new @driver
    #app.start_using_tile.click

    app = TileListScreen.new @driver
    #app.wait_notifications_alert
    #
    app
  end




  def login_with_fb()
    $logger.info('[TILE HELPERS] Login With FB')
    app = TileLoginScreen.new @driver
    #app.login_with email, password
    app.btn_login_facebook.click
    app= ConfirmFBAuthScreen.new @driver
   


    app.continue.click

  end
  
  def login_without_permissions(email, password,p_flag,p_location)
    $logger.info('[TILE HELPERS] Login With')
    app = TileLoginScreen.new @driver
    app.login_with email, password

    $logger.info('[TILE HELPERS] Login - Setup')
    app = TileSetupScreen.new @driver
    app.check_and_fix_permissions(p_location)
    app.continue.click

    if(p_flag == '1')
      begin
          @driver.manage.timeouts.implicit_wait = 1
          app.wait_and_continue_accept_alert
      end
    end
    
    app.wait_and_accept_alert
    
    app = TileListScreen.new @driver
    
    #
    app
  end



  def logout
    $logger.info('[TILE HELPERS] Logout Start')
    $logger.info('[TILE HELPERS] Logout -> Check Screen')

   # @driver.find_element(:name, 'Back').click if @driver.find_element(:name, 'Back').displayed?

    app = TileListScreen.new @driver

    app.settings.click
    app = TileSettingsScreen.new @driver

   # if ENV['deviceType'] == 'android'
    #  begin
     #   app.logout_button.displayed?
      #rescue Selenium::WebDriver::Error::NoSuchElementError
       # $logger.info('[ANDROID] Log Out button not found, scrolling')
        #Appium::TouchAction.new.swipe(start_x: 300, start_y: 500, end_x: 300, end_y: 100, duration: 0).perform
        #retry
      #end
    #else
      $logger.info('[TILE HELPERS] Logout - Scroll')

     
#Appium::TouchAction.new(@driver).tap(x: 45, y: 110, duration: 1000).release.perform
          until (app.logout_button.displayed? == true)
      
                 begin
             
      
                  @driver.execute_script 'mobile: scroll', direction: 'down'
                  $logger.info('[TILE HELPERS] Logout - Scroll More')

        
                end

          end  
    app.logout_button.click
    $logger.info('[TILE HELPERS] Logout Done')



  end

  def check_and_dismiss_coachmarks
    $logger.info('[TILE HELPERS] Check for Coachmarks')
    begin
      bluetooth_coachmark = BluetoothCoachmarkScreen.new @driver
      bluetooth_coachmark.continue_button.click
      $logger.info('[TILE HELPERS] Check for Coachmarks - Dismiss Bluetooth')
    rescue
      $logger.info('rescue coachmark')
    end
  end


end