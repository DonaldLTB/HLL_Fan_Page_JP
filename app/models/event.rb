class Event < ApplicationRecord
  belongs_to :user
  EVENT_IMAGE = { "Team vs. Team イベント" =>
  "https://cdn.discordapp.com/attachments/727904622114635839/783966728245477406/never_play_alone_u7_goodbye.border.png",
  "普通のイベント" =>
  "https://cdn.discordapp.com/attachments/727904622114635839/822258963705757696/u47dc8si4u841.jpg",
  "普通のイベント２" =>
  "https://cdn.discordapp.com/attachments/727904622114635839/824229893285347388/A_Flanked_Garrison.jpg",
  "夜イベント" =>
  "https://cdn.discordapp.com/attachments/727904622114635839/824229893285347388/A_Flanked_Garrison.jpghttps://cdn.discordapp.com/attachments/727904622114635839/823625438622515220/HighresScreenshot00127a.jpg",
  "夜イベント２" =>
  "https://cdn.discordapp.com/attachments/727904622114635839/824974036064927774/HighresScreenshot00133a.png",
  "訓練" => "https://i.imgur.com/EgbDqtd.png",
  "訓練2" => "https://i.imgur.com/age8Jq0.png",
  "Admin イベント" => "https://cdn.discordapp.com/attachments/727904622114635839/748889640009990174/Hell_let_loose_HR.png" }

end
