require 'pry'

def game_hash
 game_hash = {
   :home => {
     :team_name => "Brooklyn Nets",
     :colors => ["Black", "White"],
     :players => {
       "Alan Anderson" => {
         :number => 0,
         :shoe => 16,
         :points => 22,
         :rebounds => 12,
         :assists => 12,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 1
       },
       "Reggie Evans" => {
         :number => 30,
         :shoe => 14,
         :points => 12,
         :rebounds => 12,
         :assists => 12,
         :steals => 12,
         :blocks => 12,
         :slam_dunks => 7
       },
       "Brook Lopez" => {
         :number => 11,
         :shoe => 17,
         :points => 17,
         :rebounds => 19,
         :assists => 10,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 15
       },
       "Mason Plumlee" => {
         :number => 1,
         :shoe => 19,
         :points => 26,
         :rebounds => 12,
         :assists => 6,
         :steals => 3,
         :blocks => 8,
         :slam_dunks => 5
       },
       "Jason Terry" => {
         :number => 31,
         :shoe => 15,
         :points => 19,
         :rebounds => 2,
         :assists => 2,
         :steals => 4,
         :blocks => 11,
         :slam_dunks => 1
       }
     }
   },
   :away => {
   :team_name => "Charlotte Hornets",
   :colors => ["Turquoise", "Purple"],
   :players => {
     "Jeff Adrien" => {
       :number => 4,
       :shoe => 18,
       :points => 10,
       :rebounds => 1,
       :assists => 1,
       :steals => 2,
       :blocks => 7,
       :slam_dunks => 2
     },
     "Bismak Biyombo" => {
       :number => 0,
       :shoe => 16,
       :points => 12,
       :rebounds => 4,
       :assists => 7,
       :steals => 7,
       :blocks => 15,
       :slam_dunks => 10
     },
     "DeSagna Diop" => {
       :number => 2,
       :shoe => 14,
       :points => 24,
       :rebounds => 12,
       :assists => 12,
       :steals => 4,
       :blocks => 5,
       :slam_dunks => 5
     },
     "Ben Gordon" => {
       :number => 8,
       :shoe => 15,
       :points => 33,
       :rebounds => 3,
       :assists => 2,
       :steals => 1,
       :blocks => 1,
       :slam_dunks => 0
     },
     "Brendan Haywood" => {
       :number => 33,
       :shoe => 15,
       :points => 6,
       :rebounds => 12,
       :assists => 12,
       :steals => 22,
       :blocks => 5,
       :slam_dunks => 12
     }
   }
 }
}
end

def num_points_scored(player_name)
  game_hash.each do |location, information|
    information[:players].each do |player, stats|
      if player_name == player
      return stats[:points]
      end
    end
  end 
end

def shoe_size(player_name)
  game_hash.each do |location, information|
    information[:players].each do |player, stats|
      if player_name == player
        return stats[:shoe]
      end
    end  
  end
end  

def team_colors(team_name)
  game_hash.each do |location, team|
    team.each do |attribute, value|
      if team_name == value 
        return team[:colors]
      end
    end
  end
end

def team_names
  game_hash.map do |location, team|
   team[:team_name]
    end
end

# arr = []
#   game_hash.each do |location, team|
#    value = team[:team_name]
#     arr << value
#   end
#   arr
# end

def player_numbers(team_name)
  #returning an array of all the player numbers for each team
 arr = [] 
  game_hash.each do |location, team|
    if team[:team_name] == team_name
      team[:players].each do |player_name, player_info|
         arr << player_info[:number]
        end
      end
  end
  arr
end

def player_stats(player)
  all_players = get_all_players
  all_players[player]
end


def get_all_players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end


def big_shoe_rebounds
  all_players = get_all_players
  max_shoe = 0
  player_with_max_shoe = ""

  all_players.each do |player_name, player_stats|
    if player_stats[:shoe] > max_shoe
      max_shoe = player_stats[:shoe]
      player_with_max_shoe = player_name
    end
  end

  all_players[player_with_max_shoe][:rebounds]
end

