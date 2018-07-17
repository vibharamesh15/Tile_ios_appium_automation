# frozen_string_literal: true

require_relative '../../spec_helper'

describe 'The Tile App', disabled: true do
  before(:each) do
    $helpers.login
  end

  after(:each) do
    $helpers.logout
  end

  it 'switches tabs several times and does not crash' do
    app = TileListScreen.new @driver
    50.times do
      [app.list_tab, app.map_tab, app.notifications_tab].each(&:click)
    end
  end

  # # it 'refreshes the list several times and does not crash' do
  # #   app = TileListScreen.new @driver
  # #   50.times do
  # #     app.swipe_to_refresh
  # #   end
  # # end

  # it 'moves back and forth between the Tile Details screen and the Tile List', disabled: true do
  #   10.times do
  #     app = TileListScreen.new @driver
  #     app.tap_tile 'Wallet'
  #     $helpers.check_and_dismiss_coachmarks
  #     app = TileDetailsScreen.new @driver
  #     app.back_button.click
  #   end
  # end
end
