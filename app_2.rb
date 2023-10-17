require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts " ------------------------------------------------ "
puts "| Hey! Bienvenue sur 'ILS VEULENT TOUS MA POO ! '| "
puts "| Pour gagner, une seule règle..... SURVIVRE !   |"
puts " ------------------------------------------------ "

humanplayer1 = HumanPlayer.new("HumanPlayer")

ennemies = [Player.new("Josiane"), Player.new("José")]

puts "Voici l'état de chaque joueur"

humanplayer1.show_state
ennemies.each { |ennemy| ennemy.show_state }

while humanplayer1.life_points > 0 || ennemies.life_points > 0
    humanplayer1.attacks (ennemies[0])
    humanplayer1.attacks (ennemies[1])
    humanplayer1.show_state
    ennemies[0].show_state
    ennemies[1].show_state
    puts "\n"
    break if ennemies[0].life_points <= 0
    break if ennemies[1].life_points <= 0
    ennemies[0].attacks (humanplayer1)
    ennemies[1].attacks (humanplayer1)

end

puts " La partie est finie ..."



puts "\n"


binding.pry