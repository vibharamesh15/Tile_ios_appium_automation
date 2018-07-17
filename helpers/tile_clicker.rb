# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'pry-nav'

# TODO: Refactor, the server must return
# whether it clicked or not to remove the sleep

class TileClicker
  def initialize
    url = 'http://localhost:8008'
    uri = URI.parse(url)
    @http = Net::HTTP.new(uri.host, uri.port)
    @request = Net::HTTP::Post.new(
      uri.request_uri,
      'Content-Type' => 'application/json'
    )
  end

  def click
    url = 'http://localhost:8008/click/single/'
    uri = URI.parse(url)
    @http = Net::HTTP.new(uri.host, uri.port)
    @request = Net::HTTP::Post.new(
      uri.request_uri,
      'Content-Type' => 'application/json'
    )
    @http.request(@request)
    sleep(2)
  end

  def double_click
    url = 'http://localhost:8008/click/double/'
    uri = URI.parse(url)
    @http = Net::HTTP.new(uri.host, uri.port)
    @request = Net::HTTP::Post.new(
      uri.request_uri,
      'Content-Type' => 'application/json'
    )
    @http.request(@request)
    sleep(2)
  end

  def long_press
    url = 'http://localhost:8008/click/press/'
    uri = URI.parse(url)
    @http = Net::HTTP.new(uri.host, uri.port)
    @request = Net::HTTP::Post.new(
      uri.request_uri,
      'Content-Type' => 'application/json'
    )
    @http.request(@request)
    sleep(2)
  end
end
