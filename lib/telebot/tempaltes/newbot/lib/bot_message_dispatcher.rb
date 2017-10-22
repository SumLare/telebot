require_relative 'bot_command'
require './environment'

class BotMessageDispatcher
  attr_reader :message, :user, :base

  def initialize(message, user)
    @message = message
    @user = user
    @base = BotCommand::Base.new(user, message)
  end

  def process
    # Your code goes here...
  end

  def reply_to_message(command)
    if command && language
      command_process(command)
    elsif next_bot_command
      execute_next_command_method(next_bot_command)
    end
  end

  protected

  def parse_command
    AVAILABLE_COMMANDS.detect { |command_class| command_class.new(user, message).should_start? }
  end

  def command(command)
    Kernel.const_get("BotCommand::#{command}").new(user, message)
  end

  def command_process(command)
    command_class = command.new(user, message)
    return base.send_message(I18n.t('no_events')) unless event_exists?(command_class)
    track(command, command_class)
    command_class.start
  end

  def next_bot_command
    user.bot_command_data['method']
  end

  def execute_next_command_method(method)
    Kernel.const_get(user.bot_command_data['class']).new(user, message).public_send(method)
  end
end
