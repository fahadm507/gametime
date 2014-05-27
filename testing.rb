require 'csv'
array =[]
def get_csv_data(array)
  CSV.foreach('data.csv',headers: true,header_converters: :symbol) do |row|
    array << row.to_hash
  end
 array
end

@team_info = get_csv_data(array)
=begin
array_of_teams = []
wins = 0
team2 = nil
team_info.uniq.each do |team|
  if team[:home_score] > team[:away_score]
    away_team = team[:away_team]
    loss = 1
    wins =
    home_team = team[:home_team]
    win = 1

    puts "home team: #{team} win: #{win} loss: #{loss}"
    puts "away team: #{away_team} wins: #{away_team_wins} loses: #{away_team_loss}"
  else
    if team[:home_score] < team[:away_score]
      home_team = team[:home_team]
      away_team_wins = 1
      away_team_loss = 0
      team = team[:away_team]
      win = 0
      loss = 1
      puts "team name: #{team} win: #{win} loss: #{loss}"
      puts "lost_team: #{home_team} win: #{away_team_wins} loss: #{away_team_loss}"
    end
  end
end

=end

@team_info = get_csv_data(array)
  teams = []
  @team_info.each do |team|
  team_home = team[:home_team]
  away_team = team[:away_team]
  teams << team_home
  teams << away_team
end
teams = teams.uniq
 puts @teams = teams

