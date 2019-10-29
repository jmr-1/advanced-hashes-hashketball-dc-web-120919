require "pry"

def game_hash
  nds = {:home=>{team_name: "Brooklyn Nets", colors: ["Black", "White"], 
  
    players: 
    [
      {player_name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      {player_name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      {player_name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      {player_name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      {player_name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ]
  }, 
  
  :away=>{team_name: "Charlotte Hornets", colors: ["Turquoise", "Purple"], 
    players: 
    [
      {player_name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      {player_name: "Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
      {player_name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      {player_name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      {player_name: "Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}
      ]
  }}
  
  return nds 
end

def player_searcher(player_name)
  
  nds = game_hash
  #search through players until one is found, or else return not found  
    nds.each do |team, value|
      nds[team][:players].each do |player_info|
        if player_info[:player_name] == player_name
          #puts "Player found!"
          return player_info #returns hash, can just search in this hash for specific info 
        end 
      end 
    end 
  return "Player not found"
end

def team_search(team_name)

  #search through team names and returns hash
  nds = game_hash
  nds.each do |team, traits|
    traits.each do |info, stats|
    
      if stats.to_s == team_name
        puts "Team found!"
        return traits 
      end 
    end 
  end 
end 

def team_detail(team, detail)
  
  #looks for a specific key trait from the hash and returns it 
  look_for = team[:"#{detail}"]
  return look_for 
end 

def num_points_scored(player_name)
  
  info = player_searcher(player_name)
  return info[:points]
end 

def shoe_size(player_name)
  
  info = player_searcher(player_name)
  #puts info[:shoe]
  return info[:shoe]
end

def team_colors(name)
  team_hash = team_search(name)
  colors = team_detail(team_hash, "colors")
  return colors 
end 

def team_names
  
  nds = game_hash
  name_array = []
  
  nds.each do |team, trait|
    name_array << trait[:team_name]
  end 
  return name_array
end 

def player_numbers(team_input)
  
  jersey_array = []
  team_stuff = team_search(team_input)
  
  team_stuff[:players].each do |player|
    
    jersey_array << player[:number]
  end 
  
  return jersey_array 
end 

def player_stats(player_name)
  
  info = player_searcher(player_name)
  info.delete(:player_name)
  return info 
end 

def big_shoe_rebounds
  
  high_rebounds = 0 
  shoe_size = 0 
  nds = game_hash
  #simple loop this time, need to hold shoe_size to compare and get the rebound 
  
  nds.each do |team, traits|
    
    traits[:players].each do |players|
      
      if players[:shoe] > shoe_size
        
        shoe_size = players[:shoe]
        high_rebounds = players[:rebounds]
      end 
    end 
  end 
  return high_rebounds
end 


def most_points_scored
  
  player_name = "default"
  points = 0 
  nds = game_hash
  
  #simple loop like above 
  
  nds.each do |team, traits|
    
    traits[:players].each do |players|
      
      if players[:points] > points 
        points = players[:points]
        player_name = players[:player_name]
      end 
    end 
  end 
  
  return player_name 
end 

def winning_team
  
  current_winning_team = "default"
  winning_score = 0 
  nds = game_hash
  
  nds.each do |team, traits|
    
    team_score = 0 
    traits[:players].each do |players|
      team_score += players[:points]
    end 
    
    #calculates a team's entire score then checks it against the current winner 
    if team_score > winning_score 
      current_winning_team = nds[team][:team_name].to_s 
      winning_score = team_score 
      puts "#{current_winning_team} is winning!"
    end 
  end 
  puts "#{current_winning_team} won!"
  return current_winning_team
end 

def player_with_longest_name 
  
  nds = game_hash
  long_name = ""
  
  nds.each do |team, traits|
    
    traits[:players].each do |players|
      
      if players[:player_name].length > long_name 
        long_name = players[:player_name]
      end 
    end 
    
  end 
  
  puts "#{long_name} has a long name!"
  return long_name 
end 