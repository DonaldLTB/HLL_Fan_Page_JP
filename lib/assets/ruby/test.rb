require 'steam-condenser'
require 'rbzip2'
require 'multi_json'
require 'multi_xml'




# id = SteamId.new 'demomenz'
# stats = id.game_stats 'tf2'
# achievements = stats.achievements

player = SteamId.new("doppel")
stats = player.total_playtime(686810)

p stats


