require 'steam-condenser'
require 'rbzip2'




# id = SteamId.new 'demomenz'
# stats = id.game_stats 'tf2'
# achievements = stats.achievements

master = MasterServer.new(*MasterServer::GOLDSRC_MASTER_SERVER)
player = SteamId.new("mafia-jp")
stats = player.most_played_games.class
# servers = master.servers

server = GoldSrcServer.new('192.168.0.114', 27016)
p stats
p master
p server.init
puts "hi"

