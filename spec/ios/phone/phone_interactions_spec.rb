# frozen_string_literal: true

require_relative '../../spec_helper'

describe 'The Tile App' do
  before(:each) do
    $helpers.login
  end

  it 'should allow users to hide and show their phone Tile from the list' do
    app = TileListScreen.new @driver
    wait_for { app.tiles }
    expect(app.tiles).to contain_exactly('Wallet', 'Tile 7')

    app.settings.click

    app = TileSettingsScreen.new @driver
    app.toggle_phone_in_list
    app.close_button.click

    app = TileListScreen.new @driver
    wait_for { app.tiles }
    expect(app.tiles).to contain_exactly('Wallet')

    app.settings.click

    app = TileSettingsScreen.new @driver
    app.toggle_phone_in_list
    app.close_button.click

    app = TileListScreen.new @driver
    wait_for { app.tiles }
    expect(app.tiles).to contain_exactly('Wallet', 'Tile 7')
  end
end
