# frozen_string_literal: true

require 'rspec/expectations'
require 'appium_lib'
require 'rspec'
require 'selenium-webdriver'
require 'require_all'
require 'pry-nav'
require 'touch_action'
require 'pry-rescue'
require 'pry-stack_explorer'
require 'rspec_junit_formatter'
require 'rspec/retry'
require 'logger'
require_relative '../helpers/tile_helpers'
require_relative '../helpers/tile_clicker'
require_relative '../screens/ios/ios/tile_login_screen'
require_relative '../screens/ios/ios/tile_setup_screen'
require_relative '../screens/ios/ios/tile_signup_screen'
require_relative '../screens/ios/ios/tile_list_screen'
require_relative '../screens/ios/ios/settings_screen'
require_relative '../screens/ios/ios/tile_forgot_password_screen'
require_relative '../screens/ios/ios/tile_fyp_screen'
require_relative '../screens/ios/ios/tile_details_screen'
require_relative '../screens/ios/ios/tile_details_edit_screen'
require_relative '../screens/ios/ios/activation_choose_category_screen'
require_relative '../screens/ios/ios/facebook_authentication_oauth'


$logger = Logger.new('logfile.log')

begin
  
#  if ENV['deviceType'] == 'android'
 #   require_all "#{File.join(File.expand_path(File.dirname(__FILE__)), '..', 'screens', 'android')}"
 # else
   # require_all "#{File.join(File.expand_path(File.dirname(__FILE__)), '..', 'screens', 'ios/ios')}"
  #end
   #require_all "#{File.join(File.expand_path(File.dirname(__FILE__)), '..', 'helpers')}"


   #require_all '/Users/vibhadbaux/Documents/TileCodeRepository/tileapp_e2e-master/screens/ios/ios'
path = '/Users/vibhadbaux/Documents/TileCodeRepository/tileapp_e2e-master/screens/ios/ios/'
Dir.glob(File.join('path', '**', '*.rb'), &method(:require))


rescue
  $logger.info('[SPEC HELPER] No Page Objects Found')

end

RSpec.configure do |config|
  config.verbose_retry = false
  config.display_try_failure_messages = false
  config.around :each do |ex|
    ex.run_with_retry retry: 1
  end

  config.before(:each) do |spec|
    $logger.info("[STARTING] #{spec.description}")
    if ENV['deviceType'] == 'android'
      caps = {
        deviceName: 'Nexus 5',
        bundleId: 'com.thetileapp.tile',
        automationName: 'UiAutomator2',
        fullReset: true,
        platformName: 'Android',
        app: ENV['APP'],
        newCommandTimeout: 3600
      }
    else
      caps = {
        #deviceName: 'iPhone',
        deviceName:'iPhone 7 plus',
        bundleId: 'com.thetileapp.tile',
        automationName: 'XCUITest',
        #udid: ENV['UDID'],
        #udid:'05b0f9465c337bfbeb7c9ac86d8ceebbbf4114a3',
        
        udid:'6977b873b6c5407a3eeaa56fbfbc4cf5c2ba9612' ,
        xcodeOrgId: 'XK64B7G5HB',
        xcodeSigningId: 'iPhone Developer',
        clearSystemFiles: true,
        fullReset: true,
        #noReset:true,
        useNewWDA: true,
        platformName: 'iOS',
        app: '/Users/vibhadbaux/Desktop/tile.app',
        newCommandTimeout: 1200,
        locationServicesAuthorized: true, 
      #  autoAcceptAlerts: true,

        #  showXcodeLog:true,
        updatedWDABundleId:'io.appium.WebDriverAgentrunner'
      }
    end

    # @driver = Appium::Driver.new(caps)
    # @driver.start_driver
    #server_url = "http://172.16.2.219:4723/wd/hub" # TODO: env
    server_url = "http://127.0.0.1:4723/wd/hub"
    http_client = Selenium::WebDriver::Remote::Http::Default.new
    http_client.read_timeout = 60
    http_client.open_timeout = 60
    @driver = Selenium::WebDriver.for(:remote, :desired_capabilities => caps, :url => server_url, :http_client => http_client)

    $helpers = TileHelpers.new @driver
  #  $clicker = TileClicker.new
  end

  config.after(:each) do |spec|
    $logger.info("[FINISHED] #{spec.description}")
    if spec.exception
      $logger.info("[FAILURE/#{spec.description}]: #{spec.exception}")
    else
      $logger.info("[PASSED/#{spec.description}]")
    end
    # @driver.quit
  end

  def wait_for
    Selenium::WebDriver::Wait.new(timeout: 60).until { yield }
  end
end
