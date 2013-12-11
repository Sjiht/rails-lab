class HomeController < ApplicationController
  require 'json'
  def actual
    @region = "TR"
    @summonerName = "Razal"
    @currentGame = Unirest::get "https://community-league-of-legends.p.mashape.com/api/v1.0/"+@region.to_s+"/summoner/retrieveInProgressSpectatorGameInfo/"+@summonerName.to_s, 
      headers: { 
      "X-Mashape-Authorization" => "IXt7GY5xmWWa3ttWI00vJs13GRR96P9S"
    }
  end
end
