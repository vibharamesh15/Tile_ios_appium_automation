# frozen_string_literal: true

require_relative '../../spec_helper'

describe 'The Tile App' do
  before(:each) do
    $helpers.login
  end

  it 'should allow users to switch between tabs' do
    app = TileListScreen.new @driver
    active_tab_xpath = "//XCUIElementTypeTabBar/XCUIElementTypeButton[@value='1']"
    expect(@driver.find_element(:xpath, active_tab_xpath).attribute('label')).to eq('List')

    app.map_tab.click
    expect(@driver.find_element(:xpath, active_tab_xpath).attribute('label')).to eq('Map')
    expect(@driver.find_element(:xpath, '//XCUIElementTypeMap').enabled?).to be(true)

    app.notifications_tab.click
    expect(@driver.find_element(:xpath, active_tab_xpath).attribute('label')).to eq('Notifications')
    expect(@driver.find_element(:xpath, '//XCUIElementTypeTable').enabled?).to be(true)

    app.list_tab.click
    expect(@driver.find_element(:xpath, active_tab_xpath).attribute('label')).to eq('List')
  end
end
