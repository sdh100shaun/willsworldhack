ENV['RACK_ENV'] = 'test'

$:<<::File.dirname(__FILE__)

require 'rubygems'
require 'test/unit'
require 'rack/test'
require 'yaml'
require 'sinatra'
require 'sinatra/base'
require_relative '../play_mood'

class SetupTests < Test::Unit::TestCase
include Rack::Test::Methods

  def app
    PlayMood.new
  end 
  
  def test_responds
    get '/'
    assert last_response.ok?, "not running"
    assert last_response.body =~ /<h1>Play<\/h1>/, last_response.body
  end
end