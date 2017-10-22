require 'rack'
require_relative 'bot'
require './app_config'

AppConfigurator.new.configure

run Bot.new
