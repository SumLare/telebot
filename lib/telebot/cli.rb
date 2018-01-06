require 'thor'

module Telebot
  class CLI < Thor
    desc "new BOT_PATH", "Creates new bot"

    def new(path)
      raise Error, "ERROR: #{path} already exists." if File.directory?(path)
    end

    desc 'version', 'Display version'
    map %w[-v --version] => :version

    def version
      say "Telebot #{VERSION}"
    end
  end
end
