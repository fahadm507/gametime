require 'csv'
array =[]
def get_csv_data(array)
  CSV.foreach('data.csv',headers: true,header_converters: :symbol) do |row|
    array << row.to_hash
  end
 array
end
=begin
team_info = get_csv_data(array)
array_of_teams = []
array_of_losses = []
hash ={}
wins = 1

winners = []
team_info.uniq.each do |row|
  puts  "#{row[:home_team]} has #{wins} wins " if row[:home_score].to_i > row[:away_score].to_i
  winners << row[:home_team]
end
team_info.uniq.each do |row|
  puts  "#{row[:away_team]} has #{wins} wins " if row[:home_score].to_i < row[:away_score].to_i
  winners.include? (row[:team_name])
end
=end
team_info = get_csv_data(array)
teams = []
team_info.each do |team|
  team_home = team[:home_team]
  away_team = team[:away_team]
  teams << team_home
  teams << away_team
end
puts teams.uniq












