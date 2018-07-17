# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class RingtoneScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    wait_for { ringtone_navbar }
  end

  def ringtone_navbar
    @driver.find_element(:xpath, '//XCUIElementTypeNavigationBar').find_element(:id, 'Ringtone')
  end

  def save_button
    @driver.find_element(:id, 'Save') # TODO: a11y
  end

  def select_song(song_name)
    $logger.info('[RINGTONE SCREEN] Select Song')
    valid_songs = ['Bionic Birdie', 'The Classic Call', 'Pep in Your Step', 'Blues for Slim', 'Jingle Bells', 'Auld Lang Syne']
    if valid_songs.include?(song_name)
      @driver.find_elements(:xpath, '//XCUIElementTypeStaticText').each do |element|
        element.click if element.text == song_name
      end
    else
      $logger.info('[RINGTONE SCREEN] Attempted to select wrong song')
    end
  end
end
