require_relative 'lib/bot_message_dispatcher'
require_relative 'environment'
require 'json'

class Bot
  def call(env)
    @webhook_message = JSON.parse(env['rack.input'].read)
    BotMessageDispatcher.new(@webhook_message, user).process
    empty_response
  end

  def empty_response
    ['200', { 'Content-Type' => 'application/json' }, []]
  end
end
