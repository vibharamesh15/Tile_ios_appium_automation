# frozen_string_literal: true

require_relative '../../spec_helper'

describe 'The Tile App' do
  before(:each) do
    $helpers.login
  end

  context 'when activating Tiles', disabled: true do
    it 'should let users activate a new Tile' do
      skip('blocked')
    end
    it 'should not let users activate a previously activated Tile' do
      skip('blocked')
    end
  end
end
