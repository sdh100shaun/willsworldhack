$:<<::File.dirname(__FILE__)
# Gemfile
require "rubygems"
require "bundler/setup"
require "sinatra"
require "play_mood"

set :run, false
set :raise_errors, true
run PlayMood.new