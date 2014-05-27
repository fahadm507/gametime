require 'sinatra'
require 'csv'
require 'pry'
require 'shotgun'
#leader board that shows
#team name, number of wins, number of losses for each team.

#Read data from CSV file
array =[]
def get_csv_data(array)
  CSV.foreach('data.csv',headers: true,header_converters: :symbol) do |row|
    array << row.to_hash
  end
  array
end

@team_info = get_csv_data(array)

#This method tests if the desired information can be succefully accessed
def get_team_info(team_info)
  team_info.each do |team|
    puts "#{team[:home_team]} #{team[:away_team]} #{team[:home_score]} #{team[:away_score]}"
  end
end

#redirecting the homepage request to the /leaderboard
get '/' do
  redirect '/leaderboard'
end

get '/leaderboard' do
#array of team names without dublicates
#their recent games and scores
  @team_info = get_csv_data(array)
  teams = []
  @team_info.each do |team|
  team_home = team[:home_team]
  away_team = team[:away_team]
  teams << team_home
  teams << away_team
end
  teams = teams.uniq
  @teams = teams
  erb :index
end

get '/leaderboard/:team_name' do
  #This method allows the user to enter or click on
  #team's name to see specific iformation about that team
  #still testing this code. It has some logic errors
  @team_name = nil
  win = 0
  loss = 0
  team_info = get_csv_data(array)
  team_info.uniq.each do |team|
    if team[:home_team] || team[:away_team] || team == params[:team_name]
      @team_name = params[:team_name]
      @team_home = team[:home_team]
      @team_away = team[:away_team]
      @home_score = team[:home_score]
      @away_score = team[:away_score]
        if @home_score.to_i > @away_score.to_i
          @win = 1
          @loss = 0
        elsif @home_score.to_i < @away_score.to_i
          @win = 1
          @loss = 0
        else
          @win = 0
          @loss = 1
        end
    end
  end
  erb :show
end



