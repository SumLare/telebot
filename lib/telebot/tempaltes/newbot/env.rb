module Environment
  def token
    ENV['BOT_TOKEN']
  end

  def webhook_path
    ENV['WEBHOOK_PATH']
  end
end
