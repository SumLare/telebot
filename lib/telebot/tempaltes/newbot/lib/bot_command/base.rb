require 'telegram/bot'
require './environment'

include Environment

module BotCommand
  class Base
    attr_reader :user, :message, :api

    def initialize(user = {}, message = {})
      @user = user
      @message = message
      @api = Telegram::Bot::Api.new(Environment.token)
    end

    def should_start?
      raise NotImplementedError, "Implementation of Base::should_start? method doesn't exist"
    end

    def start
      raise NotImplementedError, "Implementation of Base::start method doesn't exist"
    end

    def send_message(text, options = {})
      api.send_message({ chat_id: chat_id, text: text }.update(options))
    end

    protected

    def bot_name
      api.getMe['result']['username']
    end

    def command_without_params?(text, command)
      text.split(command).empty? || text.split("#{command}@#{bot_name}").empty?
    end

    def command_with_params(text, command)
      text&.starts_with?("#{command} ") || text&.starts_with?("#{command}@#{bot_name} ")
    end
  end
end
