# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class TileDetailsEditScreen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    wait_for { tile_name_field }
  end

  # Details SubView
  def save_button
    @driver.find_element(:id, 'Save')
  end

def back_button
    @driver.find_element(:id, 'Back')
  end


  def tile_name_field
    @driver.find_element(:id, 'txt_tile_name')
  end

  def category
    @driver.find_element(:id, 'Category') # TODO: a11y
  end

  def change_photo
    @driver.find_element(:id, 'Change Photo')
  end

  def choose_existing_photo_button
    @driver.find_element(:id, 'Choose Existing')
  end

  def cancel_button
    @driver.find_element(:id, 'Cancel')
  end

  def hide_tile
    @driver.find_element(:id, 'Hide Tile').click # TODO: a11y
  end
end
