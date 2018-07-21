# frozen_string_literal: true

require_relative '../../spec_helper'

describe 'The Tile App' do
  before(:each) do
   $helpers.login_with 'vibha.ramesh@thetileapp.com', 'raghupannu'
  end

  context 'Basic Tile Flow' do
    it 'Find Tile and change the details', disabled: false   do
      app = TileListScreen.new @driver
     app.tap_tile 'Keys'
    
  # @driver.manage.timeouts.implicit_wait = 3 
   # app.find_button.click
    app = TileDetailsScreen.new @driver
  #  $helpers.check_and_dismiss_coachmarks

    #wait_for { app.find_button }
    $logger.info('[TILE DETAILS SCREEN] Will Ring Tile')
   
    @driver.manage.timeouts.implicit_wait = 2
    app.find_button.click

   # @driver.find_element(:id, 'btn_find').click


    @driver.manage.timeouts.implicit_wait = 5

    #wait_for { app.ringing }
    app.find_button.click    
    #@driver.find_element(:id, 'btn_find').
    $logger.info('[TILE DETAILS SCREEN] Will Stop Ringing Tile')


    app.back_button.click



      app = TileListScreen.new @driver

      app.tap_tile 'Keys'
      $helpers.check_and_dismiss_coachmarks

      app = TileDetailsScreen.new @driver

      app.options_tab.click

      app.details.click

      app = TileDetailsEditScreen.new @driver

      wait_for { app.tile_name_field }

      new_name = "Keys #{Time.now.to_i}"
      begin
        app.tile_name_field.clear
      rescue Selenium::WebDriver::Error::UnknownError
        $logger.info('[EDIT TILE] Exception while clearing the text field/come back after WDAgent is updated and fix this')
      end
      app.tile_name_field.send_keys new_name

      app.back_button.click

      app = TileDetailsScreen.new @driver

     # expect(app.tile_name.value).to eq(new_name)

      # Restore
      app.details.click
      app = TileDetailsEditScreen.new @driver

      wait_for { app.tile_name_field }
      begin
        app.tile_name_field.clear
      rescue Selenium::WebDriver::Error::UnknownError
        $logger.info('[EDIT TILE] Exception while clearing the text field/come back after WDAgent is updated and fix this')
      end
      app.tile_name_field.send_keys 'Keys'
     
      app.back_button.click

 #     app = TileListScreen.new @driver

  #    app.tap_tile 'Keys'
    


    
   #   $helpers.check_and_dismiss_coachmarks

       app = TileDetailsScreen.new @driver

     # app.options_tab.click

      app.details.click
      app = TileDetailsEditScreen.new @driver
     # app.category.click



      @driver.find_element(:id , 'Keys').click
      app = ChooseCategorySceen.new @driver

      app.choose_category 'Purse' # TODO: i18n

      app = TileDetailsEditScreen.new @driver

      app.back_button.click

      app = TileDetailsScreen.new @driver

     # expect(app.tile_name.value).to eq('Purse') # TODO: i18n

      # Revert to Wallet
      app.details.click
      app = TileDetailsEditScreen.new @driver
      # app.category.click

       @driver.find_element(:id , 'Purse').click
      app = ChooseCategorySceen.new @driver

      app.choose_category 'Keys' # TODO: i18n

      app = TileDetailsEditScreen.new @driver
      app.back_button.click


      app = TileDetailsScreen.new @driver
      app
      
     # expect(app.tile_name.value).to eq('Wallet')
    end

   
    it 'should let users hide a Tile', disabled:true do
     
      app = TileListScreen.new @driver
      app.tap_tile 'Wallet'
      $helpers.check_and_dismiss_coachmarks

      app = TileDetailsScreen.new @driver

      app.options_tab.click

      app.details.click

      app = TileDetailsEditScreen.new @driver
      app.hide_tile

      
      @driver.manage.timeouts.implicit_wait = 3
    begin
      app = TileListScreen.new @WebDriver
     rescue 

       $logger.info('[TILE DETAILS SCREEN] Hide tile ')
    end

    end

    it 'should let users unhide a Tile', disabled:true do


    $logger.info('[TILE HELPERS] Login With')
    app = TileLoginScreen.new @driver
    app.login_with 'vibha.ramesh@thetileapp.com', 'raghupannu'
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

    $logger.info('[TILE DETAILS SCREEN] unHide tile ')
      

      app.settings.click

      app = TileSettingsScreen.new @driver

     # wait_for { app.settings }
    
      app.manage_hidden_tiles

      app.unhide('Wallet')
      app.back_button.click

      app.close_button.click
    end

    it 'should let users share a Tile with someone who is on the Tile network', disabled: true  do
      app = TileListScreen.new @driver
      app.tap_tile 'Wallet'
      $helpers.check_and_dismiss_coachmarks
      app = TileDetailsScreen.new @driver

      app.options_tab.click

      app.share.click

     # @driver.switch_to.alert.accept

      wait_for { @driver.find_element(:xpath, '//XCUIElementTypeTextField') }
      @driver.find_element(:xpath, '//XCUIElementTypeTextField').send_keys 'qa-team@thetileapp.com' # TODO: a11y

     # @driver.find_ele_by_attr('XCUIElementTypeButton', 'label', 'Share').click # TODO: a11y, Alert

      @driver.find_element(:id, 'Share').click 

   #   wait_for { @driver.find_ele_by_attr('XCUIElementTypeCell', 'name', 'options_share').text != 'Share' } # TODO: ugh

#      shared_text = 'Shared with (qa-team@thetileapp.com)'

 #     expect(@driver.find_ele_by_attr('XCUIElementTypeCell', 'name', 'options_share').text).to eq(shared_text) # TODO: PO

  #    @driver.find_ele_by_attr('XCUIElementTypeCell', 'name', 'options_share').click

      wait_for { @driver.find_element(:xpath, '//XCUIElementTypeAlert') } # TODO: PO

      @driver.switch_to.alert.accept

   #   wait_for { @driver.find_ele_by_attr('XCUIElementTypeCell', 'name', 'options_share').text != shared_text } # TODO: ugh

    #  expect(@driver.find_ele_by_attr('XCUIElementTypeCell', 'name', 'options_share').text).to eq('Share') # TODO: PO
    end

    it 'should let users share a Tile with someone who needs to be invited', disabled: true do
      skip('needs to be implemented')
    end
  end
end