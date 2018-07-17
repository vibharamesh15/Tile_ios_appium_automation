# frozen_string_literal: true

require 'rspec/expectations'
require 'appium_lib'
require 'rspec'
require 'selenium-webdriver'
require 'require_all'
require 'pry-nav'
require 'pry-rescue'
require 'pry-stack_explorer'
require 'rspec_junit_formatter'
require 'rspec/retry'
require 'logger'

$logger = Logger.new('logfile.log')

begin
  if ENV['deviceType'] == 'android'
    require_all "#{File.join(File.expand_path(File.dirname(__FILE__)), '..', 'screens', 'android')}"
  else
    require_all "#{File.join(File.expand_path(File.dirname(__FILE__)), '..', 'screens', 'ios')}"
  end
  require_all "#{File.join(File.expand_path(File.dirname(__FILE__)), '..', 'helpers')}"
rescue
  $logger.info('[SPEC HELPER] No Page Objects Found')
end

RSpec.configure do |config|
  config.verbose_retry = false
  config.display_try_failure_messages = false
  config.around :each do |ex|
    ex.run_with_retry retry: 3
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
        deviceName: 'iPhone 7',
        bundleId: 'com.thetileapp.tile',
        automationName: 'XCUITest',
        udid: ENV['UDID'],
        xcodeOrgId: 'XK64B7G5HB',
        xcodeSigningId: 'iPhone Developer',
        clearSystemFiles: true,
        fullReset: true,
        useNewWDA: true,
        platformName: 'iOS',
        app: ENV['APP'],
        newCommandTimeout: 3600
      }
    end

    # @driver = Appium::Driver.new(caps)
    # @driver.start_driver
    #    server_url = "http://172.16.2.2:4723/wd/hub" # TODO: env
    server_url = "http://10.1.1.122:4723/wd/hub"
    http_client = Selenium::WebDriver::Remote::Http::Default.new
    #@driver = Selenium::WebDriver.for(:remote, :desired_capabilities => caps, :url => server_url, :http_client => http_client)
    
    puts @http_client
    
    @driver = Selenium::WebDriver.for(:local, :desired_capabilities => caps, :url => server_url, :http_client => http_client)


   # $helpers = TileHelpers.new @driver
    $clicker = TileClicker.new
  end

  config.after(:each) do |spec|
    $logger.info("[FINISHED] #{spec.description}")
    if spec.exception
      $logger.info("[FAILURE/#{spec.description}]: #{spec.exception}")
    else
      $logger.info("[PASSED/#{spec.description}]")
    end
    @driver.quit
  end

  def wait_for
    Selenium::WebDriver::Wait.new(timeout: 120).until { yield }
  end
end
