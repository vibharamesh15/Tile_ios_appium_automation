# frozen_string_literal: true

require_relative '../../spec_helper'
#require '/Users/vibhadbaux/Documents/Tile Code repoitory/tileapp_e2e-master/spec/ios/spec_helper'



describe 'The Tile App' do
  context 'registration flow' do
    it 'allows users to register a new account', disabled: false do
   
      app = TileLoginScreen.new @driver
      app.btn_sign_up.click
      app=TileSignupScreen.new @driver
      app.signup_with('vibha.ramesh+dev113@thetileapp.com','raghupannu')
      $logger.info('[TILE HELPERS] Login - Setup')
      app = TileSetupScreen.new @driver
      app.check_and_fix_permissions('Always Allow')
      app.continue.click
      #@driver.manage.timeouts.implicit_wait = 1
      #app.wait_and_continue_accept_alert
      @driver.manage.timeouts.implicit_wait = 5
#      wait_notifications_alert

      app = TileFYPScreen.new @driver
      until (app.start_using_tile.displayed? == true)
      
                 begin
             
      
                  @driver.execute_script 'mobile: scroll', direction: 'right'
                  $logger.info('[TILE HELPERS] Logout - Scroll More')

        
                end

      end  

    app.start_using_tile.click
    @driver.manage.timeouts.implicit_wait = 1
    @driver.switch_to.alert.accept

    
    app = TileListScreen.new @driver

    $helpers.logout
      #app.btn_sign_up_registration.click
      # TODO: Finish the setup flow
    end

    it 'does not allow users to register a duplicate account', disabled: false do
       app = TileLoginScreen.new @driver
      app.btn_sign_up.click
      app=TileSignupScreen.new @driver
      app.signup_with('vibha.ramesh+dev113@thetileapp.com','raghupannu')
      $logger.info('[TILE HELPERS] Login - Setup')
  
      @driver.manage.timeouts.implicit_wait = 3
      
      app.unable_signup.click
      @driver.quit
      

    end

    
  end
end
