# frozen_string_literal: true

require_relative '../../../spec/spec_helper'

class ChooseCategorySceen
  attr_accessor :driver
  def initialize(driver)
    @driver = driver
    wait_for { search_bar }
  end

  def choose_category(category)
    @driver.find_element(:xpath, "//XCUIElementTypeStaticText[@value='#{category}']").click
  end

  def search_bar
    @driver.find_element(:name, "Search")
    # Old Driver
    # @driver.find_ele_by_attr('XCUIElementTypeSearchField', 'label', 'Search')
  end

  def categories
    category_names = []
    @driver.find_elements(:xpath, '//XCUIElementTypeCell').each do |result|
      category_names.push(result.find_element(:xpath, '//XCUIElementTypeStaticText').text)
    end
    category_names
  end
end
