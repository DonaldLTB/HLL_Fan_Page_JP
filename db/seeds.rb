puts "Cleaning up database"


Event.destroy_all
Review.destroy_all
# User.all.order(id: :desc).each{ |user| user.delete }
User.delete_all

puts "All clean"



# Users
puts "Creating random times"
n = 0
role = ["Commander", "Officer", "Rifleman", "Antitank", "Machine Gunner", "Assault", "Medic", "Engineer", "Support", "Automatic Rifleman", "Spotter", "Tank Commander", "Crewman"]
def random_start_end_time(start_time, end_time)
  array = []
  half_hour = [3, 0] # usage: #{half_hour.sample}
  if start_time < end_time
    array << "#{start_time}:00:00"
    array << "#{end_time}:00:00"
    return array
  else
    array << "#{end_time}:00:00"
    array << "#{start_time}:00:00"
    return array
  end
end
puts "Creating users"
20.times do
  # valid start and end time
  # each weekday start and end time
  days_times = []
  7.times do
    days_times << random_start_end_time(rand(8..21), rand(8..21))
  end
  random_stats = rand(57..98)
  random_servers = ["Tonberry", "Ramuh", "Kujata", "Gungnir"]
  User.create(
    username: Faker::Games::Witcher.monster,
    email: "#{n+=1}@#{n+=1}.com",
    password: "123456",
    avatar: Faker::Avatar.image,
    steam_name: Faker::Games::ElderScrolls.first_name,
    bio: Faker::Quote.matz,
    discord: "https://discord.gg/thisshouldnotworkhopefully",
    role: role.sample,
    rank: random_servers,
    sunday_start: days_times[0][0],
    sunday_end: days_times[0][1],
    monday_start: days_times[1][0],
    monday_end: days_times[1][1],
    tuesday_start: days_times[2][0],
    tuesday_end: days_times[2][1],
    wednesday_start: days_times[3][0],
    wednesday_end: days_times[3][1],
    thursday_start: days_times[4][0],
    thursday_end: days_times[4][1],
    friday_start: days_times[5][0],
    friday_end: days_times[5][1],
    saturday_start: days_times[6][0],
    saturday_end: days_times[6][1],
  )
end
puts "Done"

puts "Create User without schedule"
User.create(
  username: "CrazyGamer",
  email: "1@1.com",
  password: 123456,
  steam_name: "KillOnDemand",
  bio: "Just look at my stats and start crying since you will never get as good as me.",
  discord: "https://discord.gg/crazyLWT",
  role: role.sample,
  rank: "General"
)


content = ["Hill 400", "Foy", "Omaha Beach", "Utah Beach", "St. Mere Eglise", "Carentan"]
# Events
puts "Creating Events"
10.times do
  days_times_events = []
  days_times_events << random_start_end_time(rand(8..21), rand(8..21))
  day = 1..7
  Event.create(
    # name: Faker::Games::Fallout.quote,
    name: content.sample,
    description: Faker::Games::Overwatch.quote,
    day: rand(day),
    start_time: days_times_events[0][0],
    end_time: days_times_events[0][1],
  )
end

puts "Creating Reviews"
sleep(2)
puts "No reviews available yet!"

puts "All finished"
