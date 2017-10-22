module BotCommand
  class Start < Base
    def should_start?
      text == '/start' || text == "/start@#{bot_name}"
    end

    def start
      send_message('Hello world!')
      user.reset_next_bot_command
    end
  end
end
