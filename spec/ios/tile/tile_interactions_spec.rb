# frozen_string_literal: true

require_relative '../../spec_helper'

describe 'The Tile App' do
#  after(:each) do
 #   $helpers.logout
 # end

  
 it 'path : ring a Tile and mark a tile as not found', disabled: false do
   $helpers.login_with 'vibha.ramesh@thetileapp.com', 'raghupannu'
    app = TileListScreen.new @driver
     app.tap_tile 'Wallet'
    
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
     app.tap_tile 'Purse'
    
  # @driver.manage.timeouts.implicit_wait = 3 
   # app.find_button.click
    app = TileDetailsScreen.new @driver
  #  $helpers.check_and_dismiss_coachmarks

    #wait_for { app.find_button }
    $logger.info('[TILE DETAILS SCREEN] Will mark tile as lost')
   
    @driver.manage.timeouts.implicit_wait = 2
    app.mark_as_lost

   # @driver.find_element(:id, 'btn_find').click


    @driver.manage.timeouts.implicit_wait = 5

    #wait_for { app.ringing }
    #app.find_button.click    
    #@driver.find_element(:id, 'btn_find').
    $logger.info('[TILE DETAILS SCREEN] community notification ')

    app = TileListScreen.new @driver
    app


  end


  it 'should allow users to ring a Tile', disabled: true do
    $helpers.login_with 'vibha.ramesh@thetileapp.com', 'raghupannu'
    app = TileListScreen.new @driver
     app.tap_tile 'Wallet'
    
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
  end



it 'should allow users to mark a tile as lost', disabled: true do
    $helpers.login_with 'vibha.ramesh@thetileapp.com', 'raghupannu'
    app = TileListScreen.new @driver
     app.tap_tile 'Keys'
    
  # @driver.manage.timeouts.implicit_wait = 3 
   # app.find_button.click
    app = TileDetailsScreen.new @driver
  #  $helpers.check_and_dismiss_coachmarks

    #wait_for { app.find_button }
    $logger.info('[TILE DETAILS SCREEN] Will mark tile as lost')
   
    @driver.manage.timeouts.implicit_wait = 2
    app.mark_as_lost

   # @driver.find_element(:id, 'btn_find').click


    @driver.manage.timeouts.implicit_wait = 5

    #wait_for { app.ringing }
    #app.find_button.click    
    #@driver.find_element(:id, 'btn_find').
    $logger.info('[TILE DETAILS SCREEN] community notification ')

    app = TileListScreen.new @driver
    app
  end


  it 'should allow users to reverse ring a Tile', disabled: true do
    $helpers.login_with 'vibha.ramesh@thetileapp.com', 'raghupannu'
    app = TileListScreen.new @driver
    $clicker.double_click
    wait_for { @driver.find_element(:xpath, '//XCUIElementTypeAlert') }
    @driver.switch_to.alert.accept
  end

  it 'should prompt users to change the ringtone after the 3rd Ring', disabled: true do
    $helpers.login_with 'qa-team+automation1tile@thetileapp.com', 'tile123' # TODO: External
    app = TileListScreen.new @driver
    app.tap_tile 'Wallet'
    app = TileDetailsScreen.new @driver
    $helpers.check_and_dismiss_coachmarks

    3.times do
      wait_for { app.find_button }
      $logger.info('[TILE DETAILS SCREEN] Will Ring Tile')
      app.find_button.click

      wait_for { app.is_ringing }

      app.find_button.click
    end
  end







  context 'when marking as lost',  disabled: true do
    it 'should allow users to mark a Tile as lost', disabled: true do
      $helpers.login_with 'qa-team+automation1tile@thetileapp.com', 'tile123'
      app = TileListScreen.new @driver
      app.tap_tile 'Keys'
      app = TileDetailsScreen.new @driver

#      begin
 #       $helpers.check_and_dismiss_coachmarks
  #    rescue Selenium::WebDriver::Error::TimeOutError
   #     $logger.info('no need to handle coachmarks')
    #  end

     # if @driver.get_source.include?('Last seen nearby') == false
      #  $logger.info('[MARK AS LOST] Dismissing the tooltip on the map')
     #   app.dismiss_tooltip
   #   end

    #  begin
     #   if app.undo_button.displayed? # TODO: handle this better
      #    app.undo
       #   wait_for { app.mark_as_lost }
        #  $logger.info('[MARK AS LOST] Undo to restore state')
       # end
    #  rescue Selenium::WebDriver::Error::NoSuchElementError
     #   $logger.info('[MARK AS LOST] No need to undo')
     # end

      $logger.info('[MARK AS LOST] Marking as lost')
      app.mark_as_lost

      #app = NotifyWhenFoundScreen.new @driver
      #$logger.info('[MARK AS LOST] On NWF Screen')
      #app.done_button.click
      @driver.manage.timeouts.implicit_wait = 5
      app = TileDetailsScreen.new @driver
    end
  end

  # it "should allow users to mark a Tile as lost", :disabled => true do
  #   $helpers.login_with "qa-team+automation1tile_disconnected@thetileapp.com", "tile123"
  #   app = TileListScreen.new @driver
  #   app.tap_tile "Wallet"
  #   app = TileDetailsScreen.new @driver

  #   $helpers.check_and_dismiss_coachmarks

  #   # Dismiss ToolTip
  #   # app.dismiss_tooltip
  #   puts "[TILE DETAILS SCREEN] Will Mark as Lost"
  #   app.mark_as_lost
  #   app.undo
  #   binding.pry
  # end
end
