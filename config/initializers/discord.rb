# require 'discordrb'

# $bot = Discordrb::Bot.new token: ENV["DISCORD_KEY"]

# $bot.message(with_text: 'Ping!') do |event|
#   event.respond 'Pong!'
# end

# $bot.run
# require 'discordrb/webhooks'

# WEBHOOK_URL = 'xxx'.freeze

# client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
# client.execute do |builder|
#   builder.content = '@here NEW Event!'
#   builder.add_embed do |embed|
#     embed.title = 'Mt. Gulag'
#     embed.description = 'Raid until your eyes start to bleed!'
#     embed.timestamp = Time.now
#   end
# end
