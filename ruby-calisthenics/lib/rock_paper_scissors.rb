# My student ID is 201528015029031
class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    _hash = Hash["R" => 1, "S" => 2, "P" => 3]
    if _hash[player1[1]]==nil or _hash[player2[1]]==nil
    	raise RockPaperScissors::NoSuchStrategyError,"Strategy must be one of R,P,S"
    end
    _res = (_hash[player1[1]] - _hash[player2[1]])%3
    if(_res==1)
    	return player2
    else
    	return player1
    end
  end

  def self.tournament_winner(tournament)
    if tournament[0][0].is_a? String
    	return self.winner(tournament[0],tournament[1])
    end
    return self.winner(self.tournament_winner(tournament[0]),self.tournament_winner(tournament[1]))
  end

end