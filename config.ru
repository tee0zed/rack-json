require 'rubygems'
require 'bundler'

Bundler.require

require './config/boot.rb'
require './app.rb'

run App.new
