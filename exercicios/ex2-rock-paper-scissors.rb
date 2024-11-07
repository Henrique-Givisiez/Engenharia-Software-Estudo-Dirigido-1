class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  # Levanta um erro se o número de jogadores não for igual a 2
  raise WrongNumberOfPlayersError unless game.length == 2
  # Levanta um erro se a estratégia de qualquer jogador não for R, P ou S
  raise NoSuchStrategyError unless game.all? { |player| player[1] =~ /^[RPS]$/ }
  # Determina o vencedor com base nas regras de pedra-papel-tesoura
  game[0][1] + game[1][1] =~ /RS|SP|PR|PP|RR|SS/i ? game[0] : game[1]
end


def rps_tournament_winner(tournament)
  # se o torneio for um único jogo, determina o vencedor
  if tournament[0][0].is_a? String
    rps_game_winner(tournament)
  else
    # determina o vencedor de cada sub-torneio e depois determina o vencedor entre eles
    rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
  end
end


puts rps_game_winner([["Armando", "R"], ["Dave", "S"]])
puts rps_tournament_winner([[[["Armando", "P"], ["Dave", "S"]], [["Richard", "R"], ["Michael", "S"]]],
                            [[["Allen", "S"], ["Omer", "P"]], [["David E.", "R"], ["Richard X.", "P"]]]])



                          